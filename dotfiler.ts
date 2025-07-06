import { parseArgs } from "util";
import { readdir, symlink, stat, mkdir, lstat, readlink } from "node:fs/promises";
import { homedir } from "node:os";
import { exit } from "node:process";
import { rmSync } from "node:fs";

const homeDir = homedir();

const { values, positionals } = parseArgs({
  args: Bun.argv,
  options: {
    process: { type: 'string', },
    dir: { type: 'string' },
    forceYes: { type: 'boolean', short: "y" }
  },
  strict: true,
  allowPositionals: true,
});

function main() {
  const [_process, _dir] = positionals.splice(2)
  const forceYes = values.forceYes;
  const process = values.process || _process
  const dir = values.dir || _dir || "./"

  switch (process) {
    case "setup":
      setupDotfiles(dir).then(() => {
        console.log("Dotfile setup complete!")
      });
      break
    case "remove":
      removeDotfiles(dir, forceYes).then(() => {
        console.log("Dotfiles removed.")
      });
      break
  }
}

async function targetExists(path: string): Promise<"file" | "symlink" | false> {
  // TODO: figure out a better way to do this without the empty catch blocks...

  try {
    await stat(path)

    return "file"
  } catch { }

  try {
    await lstat(path)

    return "symlink"
  } catch { }

  return false
}

async function traverseDirectory(dir: string) {
  const filesToLink: Array<string> = [];
  const entries = await readdir(dir)

  for (const entryName of entries) {
    const { pathname } = Bun.pathToFileURL(`${dir}/${entryName}`)

    if (entryName === ".config") {
      const configFiles = await traverseDirectory(pathname)
      filesToLink.push(...configFiles)
    } else {
      filesToLink.push(pathname)
    }
  }

  return filesToLink
}

async function getDotfiles(dir: string) {
  const { pathname: configPath } = Bun.pathToFileURL(`${homeDir}/.config`)

  try {
    const configFolder = await stat(configPath)
    const configExists = configFolder.isDirectory()

    if (!configExists) {
      console.error("`~/.config/` exists, but is not a directory")
      exit(1)
    }
  } catch (e) {
    await mkdir(configPath)
  }

  return await traverseDirectory(dir)
}

async function setupDotfiles(dir: string) {
  const { pathname } = Bun.pathToFileURL(dir)
  const dotfiles = await getDotfiles(dir)

  // TODO: Add in logic to check & list for required dependencies like lazygit, ripgrep etc

  for (const dotfilePath of dotfiles) {
    const newPathName = dotfilePath.replace(pathname, homeDir);
    const exists = await targetExists(newPathName)

    if (!exists) {
      symlink(dotfilePath, newPathName)
      console.info(`Successfully created a symlink:\n${dotfilePath} -> ${newPathName}\n`)
    } else if (exists === "symlink") {
      const read = await readlink(newPathName)

      if (read === dotfilePath) {
        console.info(`symlink to this file already exists: ${newPathName}\n`)
      } else {
        console.info(`symlink already exists and points to ${read}\n`)
      }
    } else {
      console.info(`file exists: ${newPathName}\n`)
    }

  }
}

async function removeDotfiles(dir: string, forceYes: boolean = false) {
  const { pathname } = Bun.pathToFileURL(dir)
  const dotfiles = await getDotfiles(dir)

  for (const dotfilePath of dotfiles) {
    const newPathName = dotfilePath.replace(pathname, homeDir);
    const exists = await targetExists(newPathName)

    if (!exists) {
      console.info(`File doesn't exist: ${newPathName}\n`)
    } else {
      const symlinkPath = await readlink(newPathName)

      if (symlinkPath === dotfilePath || forceYes) {
        rmSync(newPathName)
        console.info(`file removed: ${newPathName}\n`)
      } else {
        const userResponse = prompt(`symlink for ${newPathName} already exists, but it points to:\n ${symlinkPath}\nContinue removing?`) || "n"

        if (["y", "yes"].includes(userResponse)) {
          rmSync(newPathName)
          console.info(`file removed: ${newPathName}\n`)
        } else {
          console.info(`Got it - file will stay put.`)
        }
      }
    }
  }
}

main()

# Software setup

**Please work through this before day 1.** It takes 20–40 minutes, most of
which is unattended downloading.

You need two things: **JASP** (used on both days) and **R + RStudio + brms**
(used on day 2 afternoon).

[← back to the main page](../README.md)

---

## 1 · JASP

Download the latest version for your operating system from
**<https://jasp-stats.org/download/>** and install it as you would any other
program.

- **Windows** — run the `.msi` installer.
- **macOS** — open the `.dmg` and drag JASP into *Applications*. On first
  launch macOS may warn that the app is from an unidentified developer;
  right-click the app and choose *Open* to get past this.
- **Linux** — a Flatpak is provided; the download page has the commands.

**Check it works:** open JASP, then *Open → Data Library*, pick any dataset,
and run any analysis. If you see results, you are done.

---

## 2 · R

Install **R 4.3 or newer** from **<https://cran.r-project.org>**.

Already have R? Check your version by opening R and running `R.version.string`.
If it is older than 4.3, please update — several packages we use no longer
build on older versions.

### Windows only: Rtools

Windows needs a compiler toolchain for Stan. Install **Rtools** matching your R
version from <https://cran.r-project.org/bin/windows/Rtools/>.

### macOS only: command line tools

Open *Terminal* and run:

```
xcode-select --install
```

If it says the tools are already installed, you are fine.

---

## 3 · RStudio

Install RStudio Desktop (free) from
**<https://posit.co/download/rstudio-desktop/>**. Install R *first* — RStudio
looks for it on startup.

---

## 4 · R packages

Open RStudio and run:

```r
install.packages(c("brms", "bayesplot", "posterior", "loo", "ggplot2", "dplyr"))
```

This pulls in a large dependency tree, including Stan. Expect it to take
10–20 minutes and to print a great deal of output. Warnings are usually fine;
errors are not.

---

## 5 · Check everything works

Download [`check-installation.R`](check-installation.R) from this folder, open
it in RStudio, and run the whole script (*Ctrl/Cmd + Shift + Enter*).

It fits a tiny model, which means it compiles Stan code — **the first run can
take 2–5 minutes with no visible progress.** That is normal, and it only
happens once.

If the script ends with `ALL CHECKS PASSED`, you are ready.

---

## If something goes wrong

Bring the **full error message** — a screenshot or a copy-paste of everything
the console printed, not just the last line. Send it ahead of time if you can:
open an [issue](../../../issues) or email us. Most Stan installation problems
have a known fix, but we need to see the actual error to name it.

Common ones:

| Symptom | Fix |
|---|---|
| `Error: C++ compiler not found` (Windows) | Rtools is missing or does not match your R version — reinstall it |
| Compilation errors on macOS | Run `xcode-select --install` |
| `there is no package called 'brms'` | The install in step 4 failed; scroll up in the console to find the first real error |
| Everything hangs on the first model fit | Wait. First compilation is genuinely slow. |

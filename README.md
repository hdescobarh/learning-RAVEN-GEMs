# RAVEN Toolbox exercises

![Python 3.11](https://img.shields.io/badge/-Python_3.11-646464?logo=python&labelColor=FFD43B)
[![Gurobi 10.0.2](https://img.shields.io/badge/Gurobi-10.0.2-2AAA8A)](https://www.gurobi.com/downloads/gurobi-optimizer-release-notes-v10-0-2/)
[![The RAVEN Toolbox 2](https://img.shields.io/badge/RAVEN-v2.8.4-2AAA8A)](https://github.com/SysBioChalmers/RAVEN)
[![Software License: GPL v3](https://img.shields.io/badge/Software_License-GPLv3-28282B)](https://www.gnu.org/licenses/gpl-3.0)
[![Content License: CC BY-NC-SA 4.0](https://img.shields.io/badge/Content_License-CC_BY_NC_SA_v4.0-28282B)](https://creativecommons.org/licenses/by-nc-sa/4.0/)


In this repository I store, for personal study purposes, solving of some [RAVEN Toolbox](https://github.com/SysBioChalmers/RAVEN)-related tutorials and exercises.

## Set up environment

Requirements:

- Activated MATLAB installation.
- Gurobi solver (optional).
- In replace of MATLAB live editor I use Jupyter notebooks. This needs a Python environment. It is strongly recommended to use a virtual environment. In the repository root directory, there is a 'requirements.txt' file with the necessary dependencies and their correct versions.

Some other worth to mention considerations are:

### Python environment

- For working with VSCode (e.g. using the VSCode Notebook instead of the default Browser notebook), in addition to Python and Jupyter extensions, it is recommended the [MATLAB extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MathWorks.language-matlab).

- The Jupyter Notebook needs the kernel for [MATLAB Integration for Jupyter](https://www.mathworks.com/products/reference-architectures/jupyter.html). The package is [jupyter-matlab-proxy](https://github.com/mathworks/jupyter-matlab-proxy).


- The jupyter-matlab-proxy has a dependency that can be very tricky to install, [jupyter_contrib_nbextensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html). Jupyter 7 has a breaking change and jupyter_contrib_nbextensions does not work corretly with it. A workaround is to install notebook < 7.0.0. Moreover, the MATLAB kernel repository states:

<blockquote>
MATLAB code execution is available on both JupyterLab 3 and JupyterLab 4, but other features (such as syntax highlighting) are currently only supported on JupyterLab 3. Install JupyterLab 3 using:<br><br>

```MATLAB
python3 -m pip install 'jupyterlab>=3.0.0,<4.0.0a0'
```
<br>
</blockquote>

This may also requires an specific version of the Jupyter Server:

```MATLAB
pip install -U "jupyter-server<2.0.0"
```




### Working in Windows

The MATLAB kernel, for some reason, in Windows looks for "python3" instead of "python":

```json
{
    "argv": [
        "python3",
        "-m",
        "jupyter_matlab_kernel",
        "-f",
        "{connection_file}"
    ],
    "display_name": "MATLAB Kernel",
    "language": "matlab",
    "interrupt_mode": "message",
    "env": {},
    "metadata": {
        "debugger": false
    },
    "copyright": "Copyright 2023 The MathWorks, Inc.",
    "description": "Jupyter kernelspec for MATLAB Kernel. For more information, please look at https://jupyter-client.readthedocs.io/en/stable/kernels.html#kernel-specs"
}
```

A workaround to this problem is to create a "python3" alias:

```powershell
Set-Alias -Name python3 -Value python
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

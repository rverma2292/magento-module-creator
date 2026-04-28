# Magento 2 Module Creator

This script automates the creation of a basic Magento 2 module structure, including the necessary registration and configuration files.

## Description

The `create_module.sh` script generates the directory structure and boilerplate files required for a new Magento 2 module. It creates:
- The module directory in `app/code/[Vendor]/[Module]`
- `registration.php`
- `etc/module.xml`

## Usage

Run the script from the project root directory with the Vendor and Module names as arguments.

### Command Line
```bash
./create_module.sh [VendorName] [ModuleName]
```

**Example:**
```bash
./create_module.sh MyCompany MyModule
```

### IDE Configuration (PhpStorm)
You can configure this script as an **External Tool** in PhpStorm for quick access:

1. Go to **Settings** > **Tools** > **External Tools**.
2. Click **+** to add a new tool.
3. Fill in the following details:
   - **Name:** Create Magento Module
   - **Program:** `/bin/bash`
   - **Arguments:** `$ProjectFileDir$/create_module.sh $Prompt$ $Prompt$`
   - **Working directory:** `$ProjectFileDir$`
4. Click **OK**.

Now you can run it from **Tools** > **External Tools** > **Create Magento Module**. It will prompt you twice: first for the **Vendor** name and then for the **Module** name.

## Requirements
- Linux/Unix environment (or WSL on Windows)
- Execute permissions on the script (`chmod +x create_module.sh`)
- Magento 2 directory structure (specifically `app/code/`)

## Output
Upon success, the script will create:
- `app/code/[Vendor]/[Module]/registration.php`
- `app/code/[Vendor]/[Module]/etc/module.xml`

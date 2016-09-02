
# zip-files
Bash command to Zip files in dir or sub dir with pattern full o incremental with retantion days to clean up dir. 

[![Software License][ico-license]](LICENSE.md)

Table of Contents
=================

  * [zip-files](#zip-files)
  * [Table of Contents](#table-of-contents)
  * [Prerequisites](#prerequisites)
  * [Install](#install)
  * [Usage](#usage)
  * [Example](#example)
  * [Contributing](#contributing)
  * [Credits](#credits)
  * [About Padosoft](#about-padosoft)
  * [License](#license)

# Prerequisites

bash

# Install

This package can be installed easy.

``` bash
cd /root/myscript
git clone https://github.com/padosoft/zip-files.git
cd zip-files
chmod +x zipfiles.sh
```

If you want to run programmatically, add it to cronjobs manually or execute install script:

``` bash
cd /root/myscript/zipfiles
chmod +x install.sh
bash install.sh
```


# Usage
``` bash
bash zip-files.sh PATHTOZIP ZIPNAME ZIPNAMEPATH [MODE 0|1|2] [DAYCHANGES] [MAXRETENTIONDAYS]
```

## Example
``` bash
bash /root/myscript/zip-files/zipfiles.sh /my/dir/images/ images.zip /my/dir/archives/ 
bash /root/myscript/zip-files/zipfiles.sh /my/dir/images/ images.zip /my/dir/archives/ 0 1
bash /root/myscript/zip-files/zipfiles.sh /my/dir/images/ images.zip /my/dir/archives/ 0 1 30
```
For help:
``` bash
bash zipfiles.sh
```

# Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) and [CONDUCT](CONDUCT.md) for details.


# Credits

- [Lorenzo Padovani](https://github.com/lopadova)
- [Padosoft](https://github.com/padosoft)
- [All Contributors](../../contributors)

# About Padosoft
Padosoft is a software house based in Florence, Italy. Specialized in E-commerce and web sites.

# License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.

[ico-license]: https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square

# Create/Edit/Modify existing packages
In order to create or modify openwrt packages there's a specific structure to keep inside 
**.ipk** packages but at least you don't need fancy tool to edit them.

## Decompress a package
```sh
tar zxvf libopenssl1.1_1.1.1l-1_mips_24kc.ipk
#> ./debian-binary          # Just a text file
#> ./data.tar.gz            # Regular .tar.gz file
#> ./control.tar.gz         # Regular .tar.gz file

# data.tar.gz # Regular .tar.gz file with real packet contents
tar zxvf data.tar.gz
#>...file1...
#>...fileN...

# control.tar.gz # Regular .tar.gz file with installation scripts
tar zxvf control.tar.gz 
#> ./                       #
#> ./control                # Text contents with package info for the DB
#> ./postinst               # Post installation script to execute
#> ./prerm                  # Pre  installation script to execute

cat /debian-binary 
#> 2.0                      # Just a text file, keep the content as it is
```

## Compress a package
Do __not__ use _"ar"_ to compress it back, use _"tar"_ instead.
```sh
# Compress package back
tar zcvf libopenssl1.1_1.1.1l-1_mips_24kc.ipk ./debian-binary ./data.tar.gz ./control.tar.gz 
#> ./debian-binary
#> ./data.tar.gz
#> ./control.tar.gz
```
Pay attention to _"./"_ for each single file, **is strictly needed**

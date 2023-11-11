# Sbopkg Queue Generator
echo 'Sync the SBopkg repo...'
sbopkg -r   #

echo 'Generate SBopkg Queue files...'
sqg -a # this will generate queue files for all packages in SBo repository


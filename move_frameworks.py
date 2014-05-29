import shutil
import os

Frameworks_Folder = os.path.join('frameworks')
Target_Frameworks_Folder = os.path.join(os.environ['S3E_DIR'], '..', 'frameworks')

# Useful function
def forEachInDir(dir, fn):
    for file in os.listdir(dir):
        file_path = os.path.join(dir, file)
        try:
            fn(file_path)
        except Exception, e:
            print e

def copyTo(outputFolder):
    def outputFn(file_path):
        outputPath = os.path.join(outputFolder, os.path.basename(file_path))
        if os.path.exists(outputPath):
            shutil.rmtree(outputPath)
        shutil.copytree(file_path, outputPath)
    return outputFn

print 'Setting up frameworks for Marmalade'

if not os.path.exists(Target_Frameworks_Folder):
    os.makedirs(Target_Frameworks_Folder)
    print 'Creating', Target_Frameworks_Folder

print 'Copying from', Frameworks_Folder, 'to', Target_Frameworks_Folder
forEachInDir(Frameworks_Folder, copyTo(Target_Frameworks_Folder))
#!bin/bash
#todo: make th e template in a text file to add it, make the template better
echo "Create a markdown file with template inside class directory for notes"

# variable declaration
current_date_time=$(date "+%Y-%m-%d_%H-%M-%S")
filename=""
directory=""
filetemplate="./template.md"

# user input
read -p "Enter file name: " filename
read -p "Enter desire directory path: " directory

file="$directory/$filename.md"
# Create dir if it doesnt exist
if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist, creating it..."
    mkdir -p "$directory" || { echo "Failed to create directory $directory. Exiting."; exit 1; }
fi
# Check if file already exists in dir
if [ -f "$file"]; then # If it does change the name with current date and time to prevent race condition
    echo "File $filename.md already exists, creating file with number"
    touch "$directory/$filename$current_date_time.md" 
    $filename="$filename$amount_created"
else # Create the file as per usual
    echo "Creating file $filename at $directory."
    touch "$directory/$filename.md"
fi

# append template contents to newly created file, if the template exists
if [ -f "$filetemplate" ]; then
    cat "$filetemplate" >> "$directory/$filename.md"
    echo "Template added to $filename.md"
else
    echo "Warning: Template file $filetemplate not found. Skipping template addition."
fi
[![N|Solid](https://github.com/zerinkr/task.git)

# logs_stats.sh

`logs_stats.sh` is a bash script that displays statistics for log files under a specified directory based on a given search string.

## Usage

To run the script, execute the following command in the terminal:

```bash
./logs_stats.sh <path> <string>
```

`path` is the path to the directory containing the log files. 

`string` is the string to search for within the log files.

If no arguments are provided, the script will display a help message.

## Example

For example, to search for log files containing the string "Chrome/" in the `/tmp/log` directory, run the following command:

```bash
./logs_stats.sh /tmp/log "Chrome/"
```

## Output

The script will display the following statistics for each log file found:

- File name
- File size (in human-readable format)
- Total lines count for the file
- Count of lines containing the search string

The output will be sorted in descending order based on the count of lines containing the search string.

## Requirements

- Bash shell and `find` command that both come preinstalled on Ubuntu.

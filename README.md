# 21-325 Notes

This repository contains notes for the 21-325 course.

## How to Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/johnyojohn/21-325-notes.git
   cd 21-325-notes
   ```

2. **Pull changes from the remote repo:**
   ```bash
   git pull origin main
   ```

3. **Create a new notes folder:**
   ```bash
   ./new.sh
   ```

4. **Edit notes:**
   Open and modify the `notes.tex` file in the newly created folder.

5. **Push changes:**
   ```bash
   git add .
   git commit -m "Add new notes for [topic]"
   git push origin main
   ```

6. **Verify CI/CD:**
   Check the remote repository to ensure that the CI/CD pipeline has run successfully.

## Additional Information

- This repository uses LaTeX for note-taking.
- Ensure you have LaTeX installed on your local machine for editing.
- The CI/CD pipeline automatically compiles LaTeX files to PDF.
- Send bugs to seungjio@andrew.cmu.edu.
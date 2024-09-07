# 21-325 Notes

This repository contains notes for the 21-325 course.

## How to Use

1. **Clone the repo:**
   ```bash
   git clone [repository-url]
   ```

2. **Create a new note folder:**
   ```bash
   ./new.sh
   ```

3. **Edit notes:**
   Open and modify the `notes.tex` file in the newly created folder.

4. **Push changes:**
   ```bash
   git add .
   git commit -m "Add new notes for [topic]"
   git push origin main
   ```

5. **Verify CI/CD:**
   Check the remote repository to ensure that the CI/CD pipeline has run successfully.

## Additional Information

- This repository uses LaTeX for note-taking.
- Ensure you have LaTeX installed on your local machine for editing.
- The CI/CD pipeline automatically compiles LaTeX files to PDF.
- Send bugs to seungjio@andrew.cmu.edu.
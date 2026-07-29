# Install the Neikens Website Refresh in VS Code

## Recommended method

1. Open this repository folder in VS Code:
   `C:\Users\jneik\Documents\GitHub\bneikens.github.io`
2. Open the VS Code terminal and create a test branch:
   `git checkout -b website-refresh`
3. Close any files you are actively editing.
4. Extract this package to a temporary folder.
5. Either run `APPLY_UPDATE.ps1` from PowerShell, or copy everything inside `SITE_FILES` into the repository root and select **Replace the files in the destination**.
6. Delete the obsolete template files listed below if you copied files manually.
7. Review `_config.yml` before publishing, especially the team job titles, biographies, service areas, and email address.
8. In VS Code, review the Source Control changes, then commit and push:
   `git add .`
   `git commit -m "Refresh website content, industrial services, contact and SEO"`
   `git push -u origin website-refresh`
9. Preview the branch or merge it into `main` after review.

## Obsolete template files to delete

- `_posts/2014-07-13-project-6.markdown`
- `_posts/2014-07-14-project-5.markdown`
- `_posts/2014-07-15-project-4.markdown`
- `_posts/2014-07-16-project-3.markdown`
- `_posts/2014-07-17-project-2.markdown`
- `_posts/2014-07-18-project-1.markdown`
- `_includes/clients.html`
- `_includes/modals.html`
- `js/contact_me.js`
- `js/jqBootstrapValidation.js`
- `mail/contact_me.php`
- `img/portfolio/`
- `img/logos/`
- `img/team/3.JPG`

## Employee photos

The website contains working placeholder graphics for:

- John Brooks
- Sam Tessier
- Nick Vanamburgh

Add square portraits to `img/team/` and update each employee's `image:` value and biography in `_config.yml`. An 800 × 800 pixel crop is recommended.

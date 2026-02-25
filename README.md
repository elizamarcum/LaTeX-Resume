This was a classic latex resume based on Michael DeCorte's resume document style.  It is now updated to use formatting from Benoît Seignovert (https://github.com/seignovert/cv)
which in turn is based on the the Awesome CV LaTeX Template from Claud D. Park: https://github.com/posquit0/Awesome-CV

I have made some significant changes to the formatting inherited from awesome-cv, and I am in the process of regularizing the formatting into a more Latex way of being.

I was also inspired by the skill tagging from [Stéphane Guedon's Resume](https://www.overleaf.com/project/5ccd465312946b32add4a506).


You can generate the PDF from the LaTeX file by running `make`.
  * Adjust the boolean `includeFullJobHistory` if you wish to include the full job history.
  * You have to run make twice, without deleting the `.aux` files, in order for the correct page numbering to show up

See the [releases section in GitHub](https://github.com/elizabrock/LaTeX-Resume/releases) for the downloadable PDF version of my resume.

## Instructions

* Install mactex (e.g. `brew install mactex`)
* Install the necessary LaTeX packages.
  * `tlmgr update --self`
  * `tlmgr install fontawesome6`
* Generate the resume:
  * `make`

## 2025 TODOs

* Add in a selected projects section! iGoDigital, GitLab, This Resume, typesetting The Rails 3 Way etc.
* Find a better way to list the subentries in the Education section
* Add links to the experience section where relevant
* Figure out the extra bit of whitespace above the "Public Speaking" section
* Either update or remove the Activities section entirely
* Evaluate reordering the resume sections
* Try a more flamboyant color for what is currently green.  E.g. purple or hot pink!
* Make sure I've actually run spell-check (https://paulwintz.com/latex-in-vscode/#ltex-spell-checking-and-grammar-checking-for-latex may help)
* Set up preview images a la https://github.com/seignovert/cv/tree/main/cv
* Finally, release a new version, compiled as final rather than draft


### Someday / Later

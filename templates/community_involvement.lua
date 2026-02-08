function community_involvement_setup()
  entries = {}
end

function record_community_involvement(positionName, positionDate, organizationName, positionDescription)
  entry = {positionName=positionName, positionDate=positionDate, organizationName=organizationName, positionDescription=positionDescription}
  table.insert(entries, entry)
end


function output_community_involvement(entry)
  if entry then
    tex.sprint("\\rendercvcommunityinvolvemententry{"..entry.positionName.."}{"..entry.positionDate.."}{"..entry.organizationName.."}{"..entry.positionDescription.."}")
  else
    tex.sprint("Community Involvement Entry null?!")
  end
end

function output_community_involvements()
  tex.sprint("\\setlength\\tabcolsep{0pt}")
  tex.sprint("\\setlength{\\extrarowheight}{0pt}")
  tex.sprint("\\begin{tabular}[t]{@{\\extracolsep{\\fill}} L{0.5\\textwidth-0.1cm} @{\\hspace{0.2cm}} L{0.5\\textwidth-0.1cm}}")

  while next(entries) do
    local entry = table.remove(entries, 1)
    output_community_involvement(entry)
    tex.sprint(" & ")
    output_community_involvement(table.remove(entries, 1))
    tex.sprint("\\\\")
  end

  tex.sprint("\\end{tabular}")
end

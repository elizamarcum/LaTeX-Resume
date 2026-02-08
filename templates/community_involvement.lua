function community_involvement_setup()
  positionNames = {}
  positionDates = {}
  organizationNames = {}
  positionDescriptions = {}
end

function record_community_involvement(positionName, positionDate, organizationName, positionDescription)
  table.insert(positionNames, positionName)
  table.insert(positionDates, positionDate)
  table.insert(organizationNames, organizationName)
  table.insert(positionDescriptions, positionDescription)
end

function make_multiline_date(date_str)
  if not string.find(date_str, "\\\\") then
    date_str = date_str.."\\\\ \\\\"
  end
  return "\\multirow{2}{*}{\\entrydatestyle{\\makecell[r]{"..date_str.."}}}"
end

function output_community_involvement()
  tex.sprint("\\setlength\\tabcolsep{0pt}")
  tex.sprint("\\setlength{\\extrarowheight}{0pt}")
  tex.sprint("\\begin{tabular}[t]{@{\\extracolsep{\\fill}} L{0.5\\textwidth - 2.6cm} R{2.5cm} @{\\hspace{0.2cm}} L{0.5\\textwidth - 2.6cm} R{2.5cm}}")
  while next(positionNames) do
    tex.sprint("\\entrytitlestyle{"..table.remove(positionNames, 1).."} \z
              & "..make_multiline_date(table.remove(positionDates, 1)).." \z
              & \\entrytitlestyle{"..table.remove(positionNames, 1).."} \z
              & "..make_multiline_date(table.remove(positionDates, 1)).." \z
              \\\\")

    tex.sprint("\\entryorganizationstyle{"..table.remove(organizationNames, 1).."} \z
              & \z
              & \\entryorganizationstyle{"..table.remove(organizationNames, 1).."} \z
              & \z
              \\\\ ")

    tex.sprint(" \\multicolumn{2}{L{0.5\\textwidth}}{\\entryorganizationnotestyle{"..table.remove(positionDescriptions, 1).."}} \z
               & \\multicolumn{2}{L{0.5\\textwidth}}{\\entryorganizationnotestyle{"..table.remove(positionDescriptions, 1).."}} \z
              \\\\ ")

    tex.sprint(" & & & \\\\")
  end
  tex.sprint("\\end{tabular}")
end

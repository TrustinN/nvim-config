---------------------------------------------------------------------------
--Functions
---------------------------------------------------------------------------

-- Returns a table containing all items in t1 followed by items in t2
--@param t1 table
--@param t2 table
--@return t1
function table.combine(t1, t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function Create_Paths(name)
    local cwd = vim.fn.expand("%:p:h")
    vim.env.New_Figure_Path = cwd .. "/figures/" .. name .. ".svg"
    vim.env.New_Figure_Name = cwd .. "/figures/" .. name .. ".pdf"
    vim.env.New_Figure_Attached_Tex = cwd .. "/figures/" .. name .. ".pdf_tex"
    return { cwd, name }
end

function Create_Proj(filename)
    local img_data = Create_Paths(filename)
    local cwd = img_data[1]
    local name = img_data[2]

    local pos = vim.api.nvim_win_get_cursor(0)
    local ypos = pos[1]
    vim.cmd.normal("3o")
    vim.api.nvim_buf_set_lines(0, ypos - 1, ypos + 2, 0, {'\\begin{fixedfigure}', '    \\incfig{' .. name .. '}', '\\end{fixedfigure}'})
    vim.api.nvim_win_set_cursor(0, {ypos + 2, 0})

    os.execute("mkdir -p " .. cwd .. "/figures/")
    os.execute("cp ~/.mystyle/math/template.svg ~/.mystyle/math/tmp/")
    os.execute("mv ~/.mystyle/math/tmp/template.svg " .. vim.env.New_Figure_Path)
    os.execute("inkscape -g ".. vim.env.New_Figure_Path)
    os.execute("inkscape --file=" .. vim.env.New_Figure_Path .. " --export-type=pdf --export-filename=" .. vim.env.New_Figure_Name .. " --export-latex")
end

function Open_Proj(filename)
    Create_Paths(filename)

    os.execute("inkscape -g " .. vim.env.New_Figure_Path)
    os.execute("inkscape -D -z --file=" .. vim.env.New_Figure_Path .. " --export-type=pdf --export-filename=" .. vim.env.New_Figure_Name .. " --export-latex")
end

function Remove_Proj(filename)
    Create_Paths(filename)

    os.execute("rm -f " .. vim.env.New_Figure_Path .. " " .. vim.env.New_Figure_Name .. " " .. vim.env.New_Figure_Attached_Tex)
end

function Matlab_New_Proj()
    local cwd = vim.fn.expand("%:p:h")
    local filename = vim.fn.input("Matlab Project Name: ")
    os.execute([[matlab -batch 'matlab.project.createProject("Name", "]] .. filename .. [[", "Folder", "]] .. cwd .. [[");']])
end







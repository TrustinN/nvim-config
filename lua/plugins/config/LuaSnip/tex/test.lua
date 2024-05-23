local function matrix(_, snip, _, _, _, _, _)
    if not snip.rows then
        snip.rows = 1
    end
    if not snip.cols then
        snip.cols = 1
    end
    local nodes = {}
    local ins_indx = 1

    for j = 1, snip.rows do
        table.insert(nodes, t("    "))
        for k = 1, snip.cols do
            table.insert(nodes, r(ins_indx, tostring(j) .. "x1" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            ins_indx = ins_indx + 1

            table.insert(nodes, t(" &"))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x2" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            table.insert(nodes, t(" "))
            ins_indx = ins_indx + 1

            table.insert(nodes, r(ins_indx, tostring(j) .. "x3" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            ins_indx = ins_indx + 1
            table.insert(nodes, t(" & "))
        end
        nodes[#nodes]=t({" \\\\", ""})
    end
    nodes[#nodes]=t("   ")
    return sn(nil, nodes)
end

return {

s({trig = "regular_align", snippetType = 'autosnippet' },
    fmta([[
        \begin{align*}
        <>
        \end{align*}
        ]],
        {
            d(1, matrix, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
        }
    )
),


}




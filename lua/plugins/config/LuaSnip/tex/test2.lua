function max(t, fn)
    if #t == 0 then return nil, nil end
    local key, value = 1, t[1]
    for i = 2, #t do
        if fn(value, t[i]) then
            key, value = i, t[i]
        end
    end
    return key, value
end

local function padding_to_scale(node_chunks)
    local function added_padding(args, _, user_args)
        -- Table of length of nodes in same column
        local length = {}
        for i = 1,#args do
            length[i] = #args[i][1]
        end

        local index, max_length = max(length, function(a,b) return a < b end)
        local ind_length = length[math.floor((tonumber(user_args[1]) - 1) / (node_chunks * tonumber(user_args[2]))) + 1]
        local diff = max_length - ind_length

        local padding = ""

        if diff == 0 then
            return ""
        else
            for k = 1, diff do
                padding = padding .. " "
            end
            return padding
        end
    end

    return added_padding
end

local function space_insert(snip, ins_indx, nodes, node_chunks)
    -- Gets node indices in the same column as current node
    local b = {}
    for i = 1, snip.rows do
        b[i] = ((ins_indx - 1) % (node_chunks * snip.cols)) + 1 + (node_chunks * snip.cols) * (i - 1)
    end
    -- Inserts padding to align & for nodes in the same column
    table.insert(nodes, f( padding_to_scale(node_chunks), b, { user_args = { {tostring(ins_indx), tostring(snip.cols)} }}))
end


local function matrix(_, snip, _, _, _, _, _)
    if not snip.rows then
        snip.rows = 1
    end
    if not snip.cols then
        snip.cols = 1
    end
    local nodes = {}
    local ins_indx = 1
    local node_chunks = 3 -- Number of insert nodes inserted per loop below

    for j = 1, snip.rows do
        table.insert(nodes, t("    "))
        for k = 1, snip.cols do
            table.insert(nodes, r(ins_indx, tostring(j) .. "x1" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            space_insert(snip, ins_indx, nodes, node_chunks)
            ins_indx = ins_indx + 1

            table.insert(nodes, t(" &"))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x2" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            space_insert(snip, ins_indx, nodes, node_chunks)
            table.insert(nodes, t(" "))
            ins_indx = ins_indx + 1

            table.insert(nodes, r(ins_indx, tostring(j) .. "x3" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
            space_insert(snip, ins_indx, nodes, node_chunks)
            ins_indx = ins_indx + 1
            table.insert(nodes, t(" & "))
        end
        nodes[#nodes]=t({" \\\\", ""})
    end
    nodes[#nodes]=t("   ")
    return sn(nil, nodes)
end


return {

s({trig = "spaced_align-", snippetType = 'autosnippet' },
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










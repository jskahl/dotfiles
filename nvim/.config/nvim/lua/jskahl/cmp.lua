local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("vue", {
  s("vuefile", {
    t({ "<script setup>", "" }),
    i(1, ""),
    t({ "", "</script>", "", "<template>", "    <div>", "" }),
    i(2, ""),
    t({ "", "    </div>", "</template>" }),
  }),
})

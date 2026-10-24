local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("def", {
		t("def "),
		i(1, "function_name"),
		t("("),
		i(2),
		t(") -> "),
		i(3, "None"),
		t(":"),
		t({ "", "    " }),
		i(0),
	}, { description = "Function definition with type hints" }),

	s("async", {
		t("async def "),
		i(1, "function_name"),
		t("("),
		i(2),
		t(") -> "),
		i(3, "None"),
		t(":"),
		t({ "", "    " }),
		i(0),
	}, { description = "Async function definition" }),

	s("class", {
		t("class "),
		i(1, "ClassName"),
		t(":"),
		t({ "", "    def __init__(self, " }),
		i(2),
		t("):"),
		t({ "", "        " }),
		i(0),
	}, { description = "Class definition" }),

	s("ifmain", {
		t("if __name__ == '__main__':"),
		t({ "", "    " }),
		i(0),
	}, { description = "If main block" }),

	s("try", {
		t("try:"),
		t({ "", "    " }),
		i(1),
		t({ "", "except " }),
		i(2, "Exception"),
		t(" as e:"),
		t({ "", "    " }),
		i(0),
	}, { description = "Try-except block" }),

	s("with", {
		t("with "),
		i(1, "open("),
		i(2, "file"),
		t(") as f:"),
		t({ "", "    " }),
		i(0),
	}, { description = "With statement" }),

	s("import", {
		t("import "),
		i(1),
	}, { description = "Import statement" }),

	s("from", {
		t("from "),
		i(1),
		t(" import "),
		i(2),
	}, { description = "From import" }),

	s("dataclass", {
		t("@dataclass"),
		t({ "", "class " }),
		i(1, "ClassName"),
		t(":"),
		t({ "", "    " }),
		i(0),
	}, { description = "Dataclass" }),

	s("pydantic", {
		t("class "),
		i(1, "ModelName"),
		t("(BaseModel):"),
		t({ "", "    " }),
		i(2, "field: "),
		i(3, "str"),
	}, { description = "Pydantic model" }),

	s("fixture", {
		t("@pytest.fixture"),
		t({ "", "def " }),
		i(1, "fixture_name"),
		t("("),
		i(2),
		t("):"),
		t({ "", "    " }),
		i(0),
	}, { description = "Pytest fixture" }),

	s("test", {
		t("def test_"),
		i(1, "name"),
		t("("),
		i(2),
		t("):"),
		t({ "", "    " }),
		i(0),
	}, { description = "Pytest test function" }),
}
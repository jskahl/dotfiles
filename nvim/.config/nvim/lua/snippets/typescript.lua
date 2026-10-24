local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("import", {
		t("import { "),
		i(1),
		t(" } from '"),
		i(2),
		t("';"),
	}, { description = "Named import" }),

	s("importd", {
		t("import "),
		i(1),
		t(" from '"),
		i(2),
		t("';"),
	}, { description = "Default import" }),

	s("importn", {
		t("import * as "),
		i(1),
		t(" from '"),
		i(2),
		t("';"),
	}, { description = "Namespace import" }),

	s("importt", {
		t("import type { "),
		i(1),
		t(" } from '"),
		i(2),
		t("';"),
	}, { description = "Type import" }),

	s("export", {
		t("export { "),
		i(1),
		t(" };"),
	}, { description = "Named export" }),

	s("exportd", {
		t("export default "),
		i(1),
		t(";"),
	}, { description = "Default export" }),

	s("exportc", {
		t("export const "),
		i(1, "name"),
		t(": "),
		i(2, "Type"),
		t(" = "),
		i(3),
		t(";"),
	}, { description = "Export const" }),

	s("fn", {
		t("function "),
		i(1, "name"),
		t("("),
		i(2),
		t("): "),
		i(3, "void"),
		t(" {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}, { description = "Function declaration" }),

	s("afn", {
		t("async function "),
		i(1, "name"),
		t("("),
		i(2),
		t("): Promise<"),
		i(3, "void"),
		t("> {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}, { description = "Async function declaration" }),

	s("arrow", {
		t("const "),
		i(1, "name"),
		t(" = ("),
		i(2),
		t("): "),
		i(3, "void"),
		t(" => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "};" }),
	}, { description = "Arrow function" }),

	s("aarrow", {
		t("const "),
		i(1, "name"),
		t(" = async ("),
		i(2),
		t("): Promise<"),
		i(3, "void"),
		t("> => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "};" }),
	}, { description = "Async arrow function" }),

	s("interface", {
		t("interface "),
		i(1, "Name"),
		t(" {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}, { description = "Interface" }),

	s("type", {
		t("type "),
		i(1, "Name"),
		t(" = "),
		i(2),
		t(";"),
	}, { description = "Type alias" }),

	s("reactfc", {
		t("import { FC } from 'react';"),
		t({ "", "" }),
		t("interface "),
		i(1, "Props"),
		t(" {"),
		t({ "", "  " }),
		i(2),
		t({ "", "}" }),
		t({ "", "" }),
		t("const "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(": FC<"),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t("> = ("),
		i(3),
		t(") => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "};" }),
		t({ "", "" }),
		t("export default "),
		f(function(args)
			return args[1][1]
		end, { 1 }),
		t(";"),
	}, { description = "React FC with TypeScript" }),

	s("useState", {
		t("const ["),
		i(1, "state"),
		t(", set"),
		f(function(args)
			return args[1][1]:gsub("^%l", string.upper)
		end, { 1 }),
		t("] = useState<"),
		i(2, "Type"),
		t(">("),
		i(3),
		t(");"),
	}, { description = "useState hook" }),

	s("useEffect", {
		t("useEffect(() => {"),
		t({ "", "  " }),
		i(1),
		t({ "", "}, [" }),
		i(2),
		t("]);"),
	}, { description = "useEffect hook" }),

	s("try", {
		t("try {"),
		t({ "", "  " }),
		i(1),
		t({ "", "} catch (" }),
		i(2, "error"),
		t(") {"),
		t({ "", "  " }),
		i(0),
		t({ "", "}" }),
	}, { description = "Try-catch block" }),

	s("promise", {
		t("new Promise<"),
		i(1, "Type"),
		t(">((resolve, reject) => {"),
		t({ "", "  " }),
		i(0),
		t({ "", "});" }),
	}, { description = "Promise constructor" }),

	s("await", {
		t("const "),
		i(1, "result"),
		t(" = await "),
		i(2),
		t(";"),
	}, { description = "Await expression" }),

	s("console", {
		t("console.log("),
		i(1),
		t(");"),
	}, { description = "console.log" }),

	s("clog", {
		t("console.log('"),
		i(1),
		t(":', "),
		i(2),
		t(");"),
	}, { description = "console.log with label" }),
}
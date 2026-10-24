local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("comp", {
		t("<script setup lang=\"ts\">"),
		t({ "", "" }),
		i(0),
		t({ "", "</script>" }),
		t({ "", "<template>" }),
		t({ "", "  " }),
		i(1),
		t({ "", "</template>" }),
		t({ "", "<style scoped>" }),
		t({ "", "  " }),
		i(2),
		t({ "", "</style>" }),
	}, { description = "Vue 3 SFC component" }),

	s("ref", {
		t("const "),
		i(1, "name"),
		t(" = ref<"),
		i(2, "Type"),
		t(">("),
		i(3),
		t(")"),
	}, { description = "Vue ref" }),

	s("reactive", {
		t("const "),
		i(1, "state"),
		t(" = reactive<"),
		i(2, "Type"),
		t(">({"),
		t({ "", "  " }),
		i(3),
		t({ "", "})" }),
	}, { description = "Vue reactive" }),

	s("computed", {
		t("const "),
		i(1, "name"),
		t(" = computed(() => "),
		i(2),
		t(")"),
	}, { description = "Vue computed" }),

	s("watch", {
		t("watch("),
		i(1, "source"),
		t(", ("),
		i(2, "newVal"),
		t(", "),
		i(3, "oldVal"),
		t(") => {"),
		t({ "", "  " }),
		i(4),
		t({ "", "})" }),
	}, { description = "Vue watch" }),

	s("emits", {
		t("const emit = defineEmits<{"),
		t({ "", "  " }),
		i(1, "event"),
		t(": ["),
		i(2, "payload"),
		t("]"),
		t({ "", "}>()" }),
	}, { description = "Vue defineEmits" }),

	s("props", {
		t("const props = defineProps<{"),
		t({ "", "  " }),
		i(1, "prop"),
		t(": "),
		i(2, "Type"),
		t({ "", "}>()" }),
	}, { description = "Vue defineProps" }),

	s("import", {
		t("import { "),
		i(1),
		t(" } from '"),
		i(2),
		t("'"),
	}, { description = "Import statement" }),

	s("importd", {
		t("import "),
		i(1),
		t(" from '"),
		i(2),
		t("'"),
	}, { description = "Default import" }),
}
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("model", {
		t("class "),
		i(1, "ModelName"),
		t("(models.Model):"),
		t({ "", "    " }),
		i(2, "field"),
		t(" = models."),
		i(3, "CharField"),
		t("(max_length="),
		i(4, "255"),
		t(")"),
		t({ "", "" }),
		t({ "", "    class Meta:" }),
		t({ "", "        db_table = '" }),
		i(5, "table_name"),
		t("'"),
		t({ "", "" }),
		t({ "", "    def __str__(self):" }),
		t({ "", "        return self." }),
		i(6, "name"),
	}, { description = "Django Model" }),

	s("view", {
		t("class "),
		i(1, "ViewName"),
		t("(View):"),
		t({ "", "    def " }),
		i(2, "get"),
		t("(self, request):"),
		t({ "", "        " }),
		i(3),
		t({ "", "        return render(request, '" }),
		i(4, "template.html"),
		t("', {})"),
	}, { description = "Django Class-Based View" }),

	s("apiview", {
		t("class "),
		i(1, "ViewName"),
		t("(APIView):"),
		t({ "", "    def " }),
		i(2, "get"),
		t("(self, request):"),
		t({ "", "        " }),
		i(3),
		t({ "", "        return Response({})" }),
	}, { description = "DRF APIView" }),

	s("serializer", {
		t("class "),
		i(1, "SerializerName"),
		t("(serializers.ModelSerializer):"),
		t({ "", "    class Meta:" }),
		t({ "", "        model = " }),
		i(2, "Model"),
		t({ "", "        fields = '__all__'" }),
	}, { description = "DRF ModelSerializer" }),

	s("url", {
		t("path('"),
		i(1, "url/"),
		t("', "),
		i(2, "ViewName"),
		t(".as_view(), name='"),
		i(3, "name"),
		t("'),"),
	}, { description = "Django URL pattern" }),

	s("form", {
		t("class "),
		i(1, "FormName"),
		t("(forms.ModelForm):"),
		t({ "", "    class Meta:" }),
		t({ "", "        model = " }),
		i(2, "Model"),
		t({ "", "        fields = '__all__'" }),
	}, { description = "Django ModelForm" }),

	s("admin", {
		t("@admin.register("),
		i(1, "Model"),
		t(")"),
		t({ "", "class " }),
		i(2, "ModelAdmin"),
		t("(admin.ModelAdmin):"),
		t({ "", "    list_display = (" }),
		i(3, "'__str__'"),
		t(")"),
		t({ "", "    search_fields = (" }),
		i(4, "'name'"),
		t(")"),
	}, { description = "Django Admin" }),

	s("migrate", {
		t("python manage.py makemigrations"),
		t({ "", "python manage.py migrate" }),
	}, { description = "Django migrate commands" }),

	s("import", {
		t("from "),
		i(1, "django"),
		t(" import "),
		i(2),
	}, { description = "Django import" }),

	s("importdrf", {
		t("from rest_framework import "),
		i(1),
	}, { description = "DRF import" }),
}
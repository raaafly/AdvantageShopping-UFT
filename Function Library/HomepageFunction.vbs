Sub doVerifyLoginWithRegisteredAccount(ByVal username, ByVal password, ByVal isRemember)
	If Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("SECTION_HEADER").Link("LINK_ICON_USER").Exist(5) Then
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("SECTION_HEADER").Link("LINK_ICON_USER").Click
		Wait 3
		
		Call doInputFormLogin(username, password, isRemember)
		Wait 3
		
		REM ** Validation User Logged
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("SECTION_HEADER").WebElement("TEXT_USER_USERNAME").Check CheckPoint("CP_TEXT_USERNAME")
	Else
		Reporter.ReportEvent micFail, "Object LINK_ICON_USER is not available", "Please Check Your Object"
	End If
End Sub

Sub doVerifyLoginWithRememberMeFeature()
	If Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("SECTION_HEADER").WebElement("TEXT_USER_USERNAME").Exist(5) Then
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("SECTION_HEADER").WebElement("TEXT_USER_USERNAME").Check CheckPoint("CP_TEXT_USERNAME")
	Else
		Reporter.ReportEvent micFail, "Object TEXT_USER_USERNAME is not available", "Please Check Your Object"
	End If
End Sub

Sub doInputFormLogin(username, password, isRemember)
	If Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("MODAL_LOGIN").Exist(5) Then
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("MODAL_LOGIN").WebEdit("FIELD_USERNAME").Set username
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("MODAL_LOGIN").WebEdit("FIELD_PASSWORD").Set password
		If isRemember Then
			Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("MODAL_LOGIN").WebCheckBox("CHECKBOX_REMEMBER_ME").Set "ON"
		End If
		Browser("ADVANTAGE_SHOPPING_HOMEPAGE").Page("MODAL_LOGIN").WebButton("BTN_SIGN_IN").Click
	Else
		Reporter.ReportEvent micFail, "There is an object that is not available", "Please Check Your Object"
	End If
End Sub

Dim browserName, browserUrl

Dim isPath: isPath = Environment.Value("PROJECT_PATH")
Dim isPathObj: isPathObj = isPath + "\ObjectRepository\"
Dim isPathFunction: isPathFunction = isPath + "\Function\"
Dim isPathDataTable: isPathDataTable = isPath + "\DataTable\"

Sub doOpenBrowser(browserName, browserUrl)
	Call doCloseBrowser(browserName)
	SystemUtil.Run browserName, browserUrl, "", "", 3
End Sub

Sub doCloseBrowser(browserName)
	SystemUtil.CloseProcessByName browserName + ".exe"
End Sub

Sub doImportDataTest(ByVal fileName, ByVal sheetName)
	pathGlobalData = getDataTable("GlobalData")
	pathLocalData = getDataTable(fileName)
	
	Call DataTable.ImportSheet(pathGlobalData, "GlobalData", dtGlobalSheet)
	Call DataTable.ImportSheet(pathLocalData, sheetName, dtLocalSheet)
End Sub

Function getDataTable(ByVal fileName)
	Dim path: path = isPathDataTable + fileName + ".xlsx"
	Set FSO = CreateObject("Scripting.FileSystemObject")
	If Not FSO.FileExists(path) Then
		Reporter.ReportEvent micFail, "File DataTable Is Not Found. Please Check Your Path!", path
		Call ExitTest()
	End If
	getDataTable = path
End Function

Sub doRunIterator()
	If Trim(DataTable.Value("RUN", dtLocalSheet)) <> "Y" Then
		Call ExitActionIteration()
	End If
End Sub

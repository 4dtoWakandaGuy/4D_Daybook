//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters Preview
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName; vDetails; vFrom; vFromPos; vOurRef; vSalutation)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters Preview")
//XPreview
Menu_Record("Letters Preview"; "Preview")
$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Letterpreview")
If ($_l_OK>=0)
	If ($_l_OK=1)
		PRINT SETTINGS:C106
		$_l_OK:=OK
	Else 
		$_l_OK:=1
	End if 
	If ($_l_OK=1)
		Letter_Text
		If (Modified record:C314([DOCUMENTS:7]))
			DB_SaveRecord(->[DOCUMENTS:7])
		End if 
		vDetails:="Company"+Char:C90(13)+"Address"
		// vAttn:="Attn: N/A"
		vOurRef:="Our Ref: "+[DOCUMENTS:7]Document_Code:1
		vFrom:="A Person"
		vFromPos:=""
		vSalutation:="Dear ..."
		ONE RECORD SELECT:C189([DOCUMENTS:7])
		FIRST RECORD:C50([DOCUMENTS:7])
		Letter_Load
		Letter_Print
		ONE RECORD SELECT:C189([DOCUMENTS:7])
		FIRST RECORD:C50([DOCUMENTS:7])
		PRT_SetPrinterPaperOptions("Letterpreview")  //NG June 2005
		
	End if 
End if 
ERR_MethodTrackerReturn("Letters Preview"; $_t_oldMethodName)
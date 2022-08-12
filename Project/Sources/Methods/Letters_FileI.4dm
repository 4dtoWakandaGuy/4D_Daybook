//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2009 13:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_BOOLEAN:C305($1; DOC_bo_CheckType)
	C_LONGINT:C283(WS_l_SelDocTemplateClass)
	C_TEXT:C284($_t_oldMethodName; $_t_WriteAccessType; $0; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_FileI")

DOC_bo_CheckType:=True:C214


FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_inW")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Letters_inW"
Case of 
	: (WS_l_SelDocTemplateClass=1)  //letter templates
		If (Count parameters:C259>=1)
			$_t_WriteAccessType:=Documents_4DWriteAccessType($1)
		Else 
			$_t_WriteAccessType:=Documents_4DWriteAccessType(True:C214)
		End if 
		FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_in"+$_t_WriteAccessType)  //NG April 2004 removed reference to ◊screen
		WIN_t_CurrentInputForm:="Letters_in"+$_t_WriteAccessType
	: (WS_l_SelDocTemplateClass=2)  //superreporttemplates
		$_t_WriteAccessType:=Documents_4DWriteAccessType(False:C215)
		FORM SET INPUT:C55([DOCUMENTS:7]; "Report_in")
		WIN_t_CurrentInputForm:="Report_in"
	: (WS_l_SelDocTemplateClass=3)  //email templates
		$_t_WriteAccessType:=Documents_4DWriteAccessType(False:C215)
		FORM SET INPUT:C55([DOCUMENTS:7]; "eMail_in")
		WIN_t_CurrentInputForm:="eMail_in"
		$_t_WriteAccessType:=Documents_4DWriteAccessType(False:C215)
	: (WS_l_SelDocTemplateClass=5)  //others
		If (Count parameters:C259>=1)
			$_t_WriteAccessType:=Documents_4DWriteAccessType($1)
		Else 
			$_t_WriteAccessType:=Documents_4DWriteAccessType(True:C214)
		End if 
		FORM SET INPUT:C55([DOCUMENTS:7]; "Letters_in"+$_t_WriteAccessType)  //NG April 2004 removed reference to ◊screen
		WIN_t_CurrentInputForm:="Letters_in"+$_t_WriteAccessType
End case 
//WIN_t_CurrentInputForm:="Letters_in"+$_t_WriteAccessType  `NG April 2004 removed reference to ◊screen
//NG may 2004 commented line above out
If ($_t_WriteAccessType="WS")
	ARRAY TEXT:C222(SRProdCode; 0)
	ARRAY TEXT:C222(SRQtyT; 10)
	ARRAY TEXT:C222(SRPricePerT; 9)
End if 
If (Count parameters:C259>=1)
	DOC_bo_CheckType:=$1
End if 
$0:=$_t_WriteAccessType
ERR_MethodTrackerReturn("Letters_FileI"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_FormCr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/5/10 9:39 PM
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(SR_blb_AreaBLOB)
	C_BOOLEAN:C305(<>SRP262)
	C_LONGINT:C283($_l_Error; $2)
	C_POINTER:C301($_ptr_SRPrint)
	C_TEXT:C284(<>SYS_t_FormPath; $_t_oldMethodName; $1; $3; SR_t_DocXML)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_FormCr2")
//Reports_FormCr2
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1)
If (Records in selection:C76([DOCUMENTS:7])=0)
	CREATE RECORD:C68([DOCUMENTS:7])
	[DOCUMENTS:7]Document_Code:1:=$1
	[DOCUMENTS:7]Table_Number:11:=$2
	If (Is macOS:C1572)
		
		If (<>SRP262)
			$_ptr_SRPrint:=->SR_blb_AreaBLOB
		Else 
			$_ptr_SRPrint:=->SR_t_DocXML
		End if 
		$_l_Error:=SR Doc 2 Report(<>SYS_t_FormPath+$3; $_ptr_SRPrint->)
		If ($_l_Error=0)
			//$_l_Error:=SR Main Table ($SRPRintPTR->;1;[DOCUMENTS]Table_Number;"")
			//$_l_Error:=SR_SetLongProperty ($SRPRintPTR->;SRP_DataSource_TableID;[DOCUMENTS]Table_Number)
			//$_l_Error:=SR_SetTextProperty ($SRPRintPTR->;SRP_DataSource_Source;"1")
			SR_SetLongProperty($_ptr_SRPrint->; SR_GetLongProperty($_ptr_SRPrint->; 1; SRP_Report_DataSource); SRP_DataSource_TableID; [DOCUMENTS:7]Table_Number:11)
			
			
			If (<>SRP262)
				[DOCUMENTS:7]SR_DOCUMENT_:4:=$_ptr_SRPrint->
			Else 
				[DOCUMENTS:7]SR_DOCUMENTXML_:34:=$_ptr_SRPrint->
				
			End if 
		Else 
			[DOCUMENTS:7]Document_Code:1:="SR •"+Substring:C12([DOCUMENTS:7]Document_Code:1; 4; 25)
		End if 
	End if 
	DB_SaveRecord(->[DOCUMENTS:7])
End if 
ERR_MethodTrackerReturn("Reports_FormCr2"; $_t_oldMethodName)

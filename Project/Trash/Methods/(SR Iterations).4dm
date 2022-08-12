//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SR Iterations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/5/10 9:45 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(SR_blb_AreaBLOB)
	C_BOOLEAN:C305(<>SRP262)
	C_LONGINT:C283($_l_Iterations; $_l_RecordsinSelection; $_l_Result)
	C_PICTURE:C286(vPicture)
	C_POINTER:C301($_Ptr_SRHold; $_ptr_SRPrint; $_ptr_table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR Iterations")
If ([DOCUMENTS:7]Document_Font_Size:8>1)
	$_ptr_table:=Table:C252([DOCUMENTS:7]Table_Number:11)
	$_l_RecordsinSelection:=Records in selection:C76($_ptr_table->)
	$_l_Iterations:=(Int:C8($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)+Num:C11(Int:C8($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)#($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)))
	If (<>SRP262)
		$_ptr_SRPrint:=->[DOCUMENTS:7]SR_DOCUMENT_:4
		$_Ptr_SRHold:=->SR_blb_AreaBLOB
	Else 
		$_Ptr_SRHold:=->vPicture
		$_ptr_SRPrint:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
		
	End if 
	$_Ptr_SRHold->:=$_ptr_SRPrint->
	//$res:=SR Main Table ($_Ptr_SRHold->;2;$_l_Iterations;"")
	SR_SetLongProperty($_Ptr_SRHold->; $_l_Iterations; SRP_DataSource_Iterations)
	
	$_ptr_SRPrint->:=$_Ptr_SRHold->
	DB_SaveRecord(->[DOCUMENTS:7])
End if 
ERR_MethodTrackerReturn("SR Iterations"; $_t_oldMethodName)

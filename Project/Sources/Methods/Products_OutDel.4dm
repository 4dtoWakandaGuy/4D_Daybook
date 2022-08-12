//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_OutDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/11/2010 22:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; PRD_bo_ShowNLA)
	C_LONGINT:C283($_l_DeletionFlag; xnext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_OutDel")
If (Records in set:C195("Userset")>0)
	Gen_Confirm3("Do you wish to permanently delete these records or mark them as no longer available?"; "Unavailable"; "Delete"; "Cancel")
	$_bo_OK:=(OK=1)
	If (xnext=0)
		
		If ($_bo_OK)
			$_l_DeletionFlag:=-1
		Else 
			
			$_l_DeletionFlag:=-2
		End if 
	Else 
		$_l_DeletionFlag:=0
	End if 
	
	OK:=1
	If ($_l_DeletionFlag#0)
		CREATE SET:C116([PRODUCTS:9]; "Master")
		USE SET:C118("Userset")
		//Minor_DelRecords (->[PRODUCTS];->[PRODUCTS]Product Code;"Products")
		FIRST RECORD:C50([PRODUCTS:9])
		While (Not:C34(End selection:C36([PRODUCTS:9])))
			If ([PRODUCTS:9]Product_Code:1#"")
				Products_Del2($_l_DeletionFlag)
			End if 
			NEXT RECORD:C51([PRODUCTS:9])
		End while 
		APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54:=$_l_DeletionFlag)
		USE SET:C118("Master")
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
		If (PRD_bo_ShowNLA)
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>-2)  //include the -1 (-2 are never displayed
		Else 
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54=0)
		End if 
		CREATE SET:C116([PRODUCTS:9]; "Master")
		Gen_OutNoF(->[PRODUCTS:9])
	End if 
End if 
ERR_MethodTrackerReturn("Products_OutDel"; $_t_oldMethodName)

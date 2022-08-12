//%attributes = {}
If (False:C215)
	//Project Method Name:      DIA_DiaryMailing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 18:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cList; DB_l_CurrentDisplayedForm; rCont; vNo; vP)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DIA_DiaryMailing")



CREATE SET:C116([DIARY:12]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([DIARY:12])>0)
	
	vNo:=Records in selection:C76([DIARY:12])
	rCont:=1
	MAsk_Print(->[DIARY:12])
	
	
	If (vP=1)
		MAsk_MS(->[DIARY:12])
		
		If (OK=1)
			If (cList=1)
				FORM SET OUTPUT:C54([DIARY:12]; "Orders_List")
				MList_Print(->[DIARY:12])
				
			End if 
			MailP_Let(->[DIARY:12])
			MailP_Lab(->[DIARY:12])
			MailP_Env(->[DIARY:12])
			MailP_Exp(->[DIARY:12])
		End if 
		
	End if 
	
End if 


USE SET:C118("$Temp")

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("DIA_DiaryMailing"; $_t_oldMethodName)
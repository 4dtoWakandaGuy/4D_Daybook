//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_OrdersMailing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 07:52
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

$_t_oldMethodName:=ERR_MethodTracker("ORD_OrdersMailing")


CREATE SET:C116([ORDERS:24]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([ORDERS:24])>0)
	
	vNo:=Records in selection:C76([ORDERS:24])
	rCont:=1
	MAsk_Print(->[ORDERS:24])
	
	
	If (vP=1)
		MAsk_MS(->[ORDERS:24])
		
		If (OK=1)
			If (cList=1)
				FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
				MList_Print(->[ORDERS:24])
				
			End if 
			MailP_Let(->[ORDERS:24])
			MailP_Lab(->[ORDERS:24])
			MailP_Env(->[ORDERS:24])
			MailP_Exp(->[ORDERS:24])
		End if 
		
	End if 
	
End if 


USE SET:C118("$Temp")

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_OrdersMailing"; $_t_oldMethodName)
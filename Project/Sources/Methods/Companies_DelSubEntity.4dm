//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_DelSubEntity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(CO_al_ViewTableToTable;0)
	//Array POINTER(COM_aptr_LBItemsSetup;0)
	//Array TEXT(CO_at_ViewTabsLabels;0)
	C_LONGINT:C283($No; vNo)
	C_TEXT:C284($_t_oldMethodName; CO_t_RelatedContact)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Companies_DelSubEntity")

//NG Feb 2004
//This method is to replace the code on the Companies_In screen
//it simply takes the code from the button xreport on each page where it appears and encompases the code
Case of 
	: (FORM Get current page:C276=1)
		//Script from x report on Page_1
		$_t_oldMethodName:=ERR_MethodTracker("Companies_DelSubEntity"; Form event code:C388)
		Case of 
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1]))  //Contacts
				$No:=vNo
				If (LBi_FindLines(->COM_aptr_LBItemsSetup))
					Companies_DelOs
					If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
						LBi_Xminuses(->COM_aptr_LBItemsSetup)
					End if 
				End if 
				vNo:=$No
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
				$No:=vNo
				If (LBi_FindLines(->COM_aptr_LBItemsSetup))
					Diary_DelBut
					If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
						LBi_Xminuses(->COM_aptr_LBItemsSetup)
					End if 
				End if 
				vNo:=$No
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //
				$No:=vNo
				If (LBi_FindLines(->COM_aptr_LBItemsSetup))
					Diary_DelBut
					If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
						LBi_Xminuses(->COM_aptr_LBItemsSetup)
					End if 
				End if 
				vNo:=$No
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[ORDERS:24]))
				$No:=vNo
				If (LBi_FindLines(->COM_aptr_LBItemsSetup))
					Orders_DelBut
					If (OK=1)  //NB: do not copy this if unless there is a del proc that returns OK
						LBi_Xminuses(->COM_aptr_LBItemsSetup)
					End if 
					OK:=1
				End if 
				vNo:=$No
				
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))
				Gen_Alert("Currently Purchase orders may not be deleted from here")
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))
				Gen_Alert("Currently Invoices may not be deleted from here")
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))
				Gen_Alert("Currently Purchase Invoices may not be deleted from here")
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))
				Gen_Alert("Currently Products may not be deleted from here")
				
			: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[JOBS:26]))
				Gen_Alert("Currently Jobs may not be deleted from here")
				
				
				
		End case 
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("Companies_DelSubEntity"; $_t_oldMethodName)
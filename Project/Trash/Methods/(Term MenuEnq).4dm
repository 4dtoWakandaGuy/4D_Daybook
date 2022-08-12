//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term MenuEnq
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_EnquiryMenuItemName; $_t_EnquiryMenuName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term MenuEnq")
$_t_EnquiryMenuName:=Get localized string:C991("Menu_EnquiryWriter")

// SET ITEM(6;0;"Inquiries";◊MenuProc)
$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MenuItem_ListInqqotord"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MenuItem_ListInqqotord"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MenuItem_ListInqqotord"); 1; $_t_EnquiryMenuItemName)
End if 
$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MenuItem_ViewProspects"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MenuItem_ViewProspects"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MenuItem_ViewProspects"); 1; $_t_EnquiryMenuItemName)
End if 
// SET_MENU ITEM(6;1;"Enter Inquiries";◊MenuProc)

$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MenuItem_ViewEnquiryWriter"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MenuItem_ViewEnquiryWriter"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MenuItem_ViewEnquiryWriter"); 1; $_t_EnquiryMenuItemName)
End if 
$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MenuItem_ListEnquiryWriter"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MenuItem_ListEnquiryWriter"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MenuItem_ListEnquiryWriter"); 1; $_t_EnquiryMenuItemName)
End if 

$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MenuItem_EnterEnquiry"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MenuItem_EnterEnquiry"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MenuItem_EnterEnquiry"); 1; $_t_EnquiryMenuItemName)
End if 

$_t_EnquiryMenuItemName:=DB_GetTranslatedTerminology(Table:C252(->[ORDERS:24]); Get localized string:C991("MeniItem_ViewEnquiries"))
If ($_t_EnquiryMenuItemName#Get localized string:C991("MeniItem_ViewEnquiries"))
	DB_MenuAction($_t_EnquiryMenuName; Get localized string:C991("MeniItem_ViewEnquiries"); 1; $_t_EnquiryMenuItemName)
End if 
ERR_MethodTrackerReturn("Term MenuEnq"; $_t_oldMethodName)

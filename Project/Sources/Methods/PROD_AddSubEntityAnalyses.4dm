//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_AddSubEntityAnalyses
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
	//Array BOOLEAN(PRD_lb_ProdFurths;0)
	//Array BOOLEAN(PROD_abo_FurtherModified;0)
	//Array TEXT(PROD_at_FurtherAnalysis;0)
	//Array TEXT(PROD_at_FurtherCode;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PROD_AddSubEntityAnalyses")

//NG Feb 2004
//The method is only applicable within the form [PRODUCTS]Products_In
//It is the script of the button Bacc_l_FurthModify which adds a new analyses(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("PROD_AddSubEntityAnalyses"; Form event code:C388)
APPEND TO ARRAY:C911(PROD_at_FurtherCode; "")
APPEND TO ARRAY:C911(PROD_at_FurtherAnalysis; "")
APPEND TO ARRAY:C911(PROD_abo_FurtherModified; False:C215)
LB_SetScroll(->PRD_lb_ProdFurths; Size of array:C274(PROD_at_FurtherCode))
LB_GoToCell(->PRD_lb_ProdFurths; 1; Size of array:C274(PROD_at_FurtherCode))
LBI_Scrollonresize(->PRD_lb_ProdFurths)
ERR_MethodTrackerReturn("PROD_AddSubEntityAnalyses"; $_t_oldMethodName)
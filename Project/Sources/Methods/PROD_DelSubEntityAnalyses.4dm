//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_DelSubEntityAnalyses
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
	//ARRAY BOOLEAN(PRD_lb_ProdFurths;0)
	//ARRAY BOOLEAN(PROD_abo_FurtherModified;0)
	ARRAY LONGINT:C221($_al_SelectedLines; 0)
	//ARRAY TEXT(PROD_at_FurtherAnalysis;0)
	//ARRAY TEXT(PROD_at_FurtherCode;0)
	//ARRAY TEXT(PROD_at_FurtherCodeDEL;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PROD_DelSubEntityAnalyses")

//NG Feb 2004
//The method is only applicable within the form [Products]Products_In
//It is the script of the button bProd_l_FurthDelete which adds an analyses(or clears an entry)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("PROD_DelSubEntityAnalyses"; Form event code:C388)
ARRAY LONGINT:C221($_al_SelectedLines; 0)
LB_GetSelect(->PRD_lb_ProdFurths; ->$_al_SelectedLines)
If (Size of array:C274($_al_SelectedLines)>=1)
	Gen_Confirm("Do you wish to delete the further analysis "+PROD_at_FurtherAnalysis{$_al_SelectedLines{1}}; "Yes"; "No")
	If (Ok=1)
		INSERT IN ARRAY:C227(PROD_at_FurtherCodeDEL; Size of array:C274(PROD_at_FurtherCodeDEL)+1; 1)
		PROD_at_FurtherCodeDEL{Size of array:C274(PROD_at_FurtherCodeDEL)}:=PROD_at_FurtherCode{$_al_SelectedLines{1}}
		DELETE FROM ARRAY:C228(PROD_at_FurtherAnalysis; $_al_SelectedLines{1})
		DELETE FROM ARRAY:C228(PROD_at_FurtherCode; $_al_SelectedLines{1})
		DELETE FROM ARRAY:C228(PROD_abo_FurtherModified; $_al_SelectedLines{1})
		LBI_Scrollonresize(->PRD_lb_ProdFurths)
	End if 
	
End if 
ERR_MethodTrackerReturn("PROD_DelSubEntityAnalyses"; $_t_oldMethodName)

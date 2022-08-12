//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLLPQtnR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2011 03:37:22If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(Write)
	C_TEXT:C284($_t_oldMethodName; Enclosures; Products; ProductsD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLPQtnR")
//WR O Find (area; criteria{; where{; method}}) ® Integer
//WR Find (area; charString; wholeWord; upperCase; wrap) ® Longint
If (Documents_4DWriteAccessType(False:C215)="W@")
	WR SET SELECTION:P12000:3(Write; 0; 0)
	//  If (WR O Find (Write;"<Products>")>0)
	If (WR Find:P12000:111(Write; "<Products>"; 1; 0; 1)>0)
		WR INSERT TEXT:P12000:19(Write; Products)
	End if 
	WR SET SELECTION:P12000:3(Write; 0; 0)
	If (WR Find:P12000:111(Write; "<ProductsD>"; 1; 0; 1)>0)
		WR INSERT TEXT:P12000:19(Write; ProductsD)
	End if 
	WR SET SELECTION:P12000:3(Write; 0; 0)
	If (WR Find:P12000:111(Write; "<Enclosures>"; 1; 0; 1)>0)
		WR INSERT TEXT:P12000:19(Write; Enclosures)
	End if 
End if 
ERR_MethodTrackerReturn("Diary_InLLPQtnR"; $_t_oldMethodName)
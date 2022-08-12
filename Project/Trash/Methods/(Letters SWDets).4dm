//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWDets
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
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	C_LONGINT:C283($_l_ContactRow; rCont; rDiary)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vDetails; vOurRef; vSalutation; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWDets")
//Letters SWDets - the proc to call for a SW Print Merge
If (Letters_LayCode)
	If ((rCont=1) & (DB_t_CurrentFormUsage="SWMerge"))  //ie if called from Simple Print Merge (Contacts only)
		$_l_ContactRow:=Find in array:C230(LB_at_02_3; [CONTACTS:1]Contact_Code:2)
		If ($_l_ContactRow>0)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=LB_at_02_4{$_l_ContactRow})
			vOurRef:=[COMPANIES:2]Company_Code:1+"-"+[CONTACTS:1]Contact_Code:2+"-"+[DOCUMENTS:7]Document_Code:1
			MCont_Add("")
		Else 
			vOurRef:=""
			vDetails:=""
			vSalutation:=""
		End if 
	Else 
		Letter_AllDets(True:C214)
	End if 
	Letter_Print2
	vText:=""
	Letter_Replace
	If (rDiary=1)
		Letter_AllocD([DOCUMENTS:7]Document_Code:1)
	Else 
		Letter_Alloc([DOCUMENTS:7]Document_Code:1)
	End if 
End if 
ERR_MethodTrackerReturn("Letters SWDets"; $_t_oldMethodName)
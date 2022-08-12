//%attributes = {}

If (False:C215)
	//Project Method Name:      COMP_SEL_2009
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SearchNewStyle; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vC; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $1; Com_t_PresetSearch; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COMP_SEL_2009")


//This is new style of Comp_Sel written for  the stock control version to implement a search direct from the form.
//something was not quite right
$_t_oldMethodName:=ERR_MethodTracker("COMP_SEL_2009")
//Comp_Sel

vC:=1
Com_t_PresetSearch:=""
If (vSelPrev="•FSC")
	Comp_SelP
Else 
	If (Count parameters:C259>=2)
		
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:="Company: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	If ($_t_Search#"")
		If (<>SearchNewStyle=False:C215)
			$_t_Search:=Gen_SearchA(Term_FSWT("Company, Postcode, Tel or Surname to find:"); vSelPrev; "Find Companies"; $_t_Search; ""; "")
		Else   // value to search is passed in here  clear it but tell the screen to search for it
			Com_t_PresetSearch:=$_t_Search
			//$_t_Search:=""
			
		End if 
	Else 
		If (<>SearchNewStyle=False:C215)
			
			$_t_Search:=Gen_SearchA(Term_FSWT("Company, Postcode, Tel or Surname to find:"); vSelPrev; "Find Companies"; Sel_CompCode; ""; "")
		Else 
			$_t_Search:=""
		End if 
	End if 
	
	If (OK=1)
		If (xNext=0)
			
			vSelPrev:=$_t_Search
			Comp_Sel2($_t_Search)
			
			
		Else 
			Comp_SelP
		End if 
	Else 
		vC:=0
	End if 
End if 
ERR_MethodTrackerReturn("COMP_SEL_2009"; $_t_oldMethodName)
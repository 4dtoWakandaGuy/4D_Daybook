//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 14:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2; $3; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vD; xNext)
	C_TEXT:C284(<>CallCode; <>JobCode; <>OrderCode; <>TimeAct; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Sel")
//Diary Sel
//Open window(10;Screen height-100;300;Screen height;1984)

vD:=1
$_t_Search:=""
If (vSelPrev="•FSC")
	Diary_SelP(False:C215)
Else 
	If (Count parameters:C259=0)
		If (DB_t_CurrentFormUsage="Time")
			$_t_Search:=Gen_Search("Job, Date or Person to find:"; vSelPrev; "Find Time")
		Else 
			Case of 
				: (<>OrderCode#"")
					$_t_Search:="Order: "+<>OrderCode
					
				: (<>JobCode#"")
					$_t_Search:="Job: "+<>JobCode
				: (<>CallCode#"")
					$_t_Search:="Call: "+<>CallCode
				Else 
					$_t_Search:=""
			End case 
			
			$_t_Search:=Gen_SearchA("Company, Date, Person or Document to find:"; vSelPrev; "Find Diary Items"; $_t_Search; Sel_ContCode; Sel_CompCode)
		End if 
	Else 
		Case of 
			: (Count parameters:C259=1)
				If ($1#"")
					$_t_Search:=$1
				Else 
					If (DB_t_CurrentFormUsage="Time")
						$_t_Search:=Gen_Search("Job, Date or Person to find:"; vSelPrev; "Find Time")
					Else 
						Case of 
							: (<>OrderCode#"")
								$_t_Search:="Order: "+<>OrderCode
								
							: (<>JobCode#"")
								$_t_Search:="Job: "+<>JobCode
							: (<>CallCode#"")
								$_t_Search:="Call: "+<>CallCode
								
							Else 
								$_t_Search:=""
						End case 
						$_t_Search:=Gen_SearchA("Company, Date, Person or Document to find:"; vSelPrev; "Find Diary Items"; $_t_Search; Sel_ContCode; Sel_CompCode)
					End if 
				End if 
				
			: (Count parameters:C259>1)
				If ($2=False:C215)
					If ($1#"")
						If (Count parameters:C259>=3)
							If ($3)
								$_t_Search:="Diary: "+$1
							Else 
								$_t_Search:=$1
							End if 
						Else 
							$_t_Search:=$1
						End if 
						
					Else 
						$_t_Search:=Gen_Search("Job, Date or Person to find:"; vSelPrev; "Find Time")
					End if 
					
				Else 
					xNext:=1
				End if 
				
		End case 
		
	End if 
	
End if 

If (OK=1)
	If (xNext=0)
		Diary_Sel2($_t_Search)
	Else 
		//```
		
		
		Diary_SelP(False:C215)
		
	End if 
	If ((DB_t_CurrentFormUsage="Time") & (Records in selection:C76([DIARY:12])>0))
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=<>TimeAct)
	End if 
Else 
	vD:=0
End if 
If ((Records in selection:C76([DIARY:12])>0) & (OK=1) & ($_t_Search#"◊IA"))
	Diary_SelCheck
End if 
//CLOSE WINDOW
ERR_MethodTrackerReturn("Diary Sel"; $_t_oldMethodName)
//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters_Sel2
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
	C_BOOLEAN:C305($S)
	C_LONGINT:C283($_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_Search; $_t_SearchAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_Sel2")
If (Count parameters:C259>=1)
	$_t_Search:=$1
Else 
	$_t_Search:=""
End if 
If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
	ALL RECORDS:C47([DOCUMENTS:7])
Else 
	If ($_t_Search="S")
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214)
	End if 
	If (($_t_Search#"S") | (Records in selection:C76([DOCUMENTS:7])=0))
		If ($_t_Search="S:@")
			$_t_Search:=Substring:C12($_t_Search; 3; 50)
			$S:=True:C214
		Else 
			$S:=False:C215
		End if 
		If ($_t_Search="Letter: @")
			$_l_StringLength:=Length:C16("Letter: ")+1
			$_t_Search:=Substring:C12($_t_Search; $_l_StringLength; 32000)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_Search)
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([DOCUMENTS:7])=0)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Person:10=$_t_SearchAt)
				If (Records in selection:C76([DOCUMENTS:7])=0)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Heading:2=$_t_SearchAt)
				End if 
			End if 
			If ($S)
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214)
			End if 
		End if 
		
	End if 
End if 
//get only live docs
//QUERY SELECTION([DOCUMENTS];[DOCUMENTS]Document_Class=4D Write Letter Template ;

QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Status:15>-100)

Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)
ERR_MethodTrackerReturn("Letters_Sel2"; $_t_oldMethodName)
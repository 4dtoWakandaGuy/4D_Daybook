//%attributes = {}
If (False:C215)
	//Project Method Name:      Sources_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vP; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources_Sel")
//Sources_Sel
//DEFAULT TABLE([SOURCES])
vP:=1
$_t_Search:=Gen_Search("Source, Publication, Product or Person:"; vSelPrev; "Find Sources")
If (OK=1)
	If (xNext=0)
		vSelPrev:=$_t_Search
		If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
			ALL RECORDS:C47([SOURCES:6])
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([SOURCES:6])=0)
				QUERY:C277([SOURCES:6]; [SOURCES:6]Publication_Code:12=$_t_SearchAt)
				If (Records in selection:C76([SOURCES:6])=0)
					QUERY:C277([SOURCES:6]; [SOURCES:6]Product_Code:6=$_t_SearchAt)
					If (Records in selection:C76([SOURCES:6])=0)
						QUERY:C277([SOURCES:6]; [SOURCES:6]Person:9=$_t_SearchAt)
					End if 
				End if 
			End if 
		End if 
	Else 
		QUERY:C277([SOURCES:6])
		If (OK=0)
			vP:=0
		End if 
	End if 
Else 
	vP:=0
End if 
ERR_MethodTrackerReturn("Sources_Sel"; $_t_oldMethodName)
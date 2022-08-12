//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 13:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; <>ViewLists; $_bo_AutoSearch; $_bo_useCurrentSelection; $8; INT_bo_DetailOpen)
	C_LONGINT:C283(<>DB_l_CBShowLinkedRecord; vNo)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_AutoSearchValue; $_t_oldMethodName; $_t_Reference; $1; $2; $3; $6; $7; $9; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Mod")

If (Count parameters:C259>=7)
	If (Count parameters:C259>=8)
		$_bo_AutoSearch:=$8
	Else 
		$_bo_AutoSearch:=False:C215
	End if 
	If (Count parameters:C259>=9)
		$_t_AutoSearchValue:=$9
	Else 
		$_t_AutoSearchValue:=""
	End if 
	If ($6="")
		$_bo_useCurrentSelection:=True:C214
	End if 
	
	
	
	Start_Process
	
	If (Execute_File($2; $4))  //MOdified NG June 2004
		While ($5->=1)
			IDLE:C311  // 03/04/03 pb
			If ($6#"")  //NG November 2004-make sure you have the selection!@!!!!!
				If ($_bo_AutoSearch)
					
					Execute_Sel($6; $_t_AutoSearchValue; $_bo_AutoSearch)
				Else 
					Execute_Sel($6)
				End if 
			End if 
			
			If ($5->=1)
				If ((Records in selection:C76($4->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
					CREATE SET:C116($4->; $3)
					CREATE EMPTY SET:C140($4->; "Userset")
					vNo:=Records in selection:C76($4->)
					$_t_Reference:=""
					If ((vAutoFind) & (<>DB_bo_AutoOut))
						Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
						Gen_ModMidAP($3; $4; $7)
					Else 
						If (((<>ViewLists=False:C215) | (<>DB_l_CBShowLinkedRecord=1)) & (Records in selection:C76($4->)=1) & (Not:C34(Read only state:C362($4->))) & (Not:C34(Locked:C147($4->))))
							<>DB_l_CBShowLinkedRecord:=0  // always reset this-it gets loaded again
							Open_Pro_Window($1; 0; 2; $4; WIN_t_CurrentInputForm)
							$_t_Reference:=Table name:C256($4)+"_"+WIN_t_CurrentInputForm
							
							
							MODIFY RECORD:C57($4->; *)
						Else 
							Open_Pro_Window($1; 0; 1; $4; WIN_t_CurrentOutputform)
							Gen_Mod2($3; $4; $7)
						End if 
					End if 
					If ($_t_Reference#"")
						Close_ProWin($_t_Reference)
					Else 
						Close_ProWin
					End if 
					
					$5->:=0
				Else 
					Gen_None($7; $5)
				End if 
			End if 
		End while 
	End if 
	
	Process_End
End if 
ERR_MethodTrackerReturn("Gen_Mod"; $_t_oldMethodName)
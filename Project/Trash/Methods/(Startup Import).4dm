//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup Import
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CharacterPosition; $_l_Index; $_l_PathIndex; $_l_Platform; $_l_SizeofArray; $_l_System; $_l_WindowReferenceRow; $_t_Machine; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284($_l_StructureName; Folder separator:K24:12; $_t_DocumentName; $_t_ListName; $_t_oldMethodName; $_t_StartPath; $_t_StructurePath; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFld)
	C_TEXT:C284(vRec; vT; vText; vTitle2)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup Import")
//Startup Import
Load_Fields


ON ERR CALL:C155("Remote_Err")

//This method doesn't work - Document just returns what you gave it
//vDoc:=Create document(Gen_DocName ("ABCD9999"))
//Close_DocUMENT(vDoc)
//DELETE DOCUMENT(Document)
//$_t_StartPath:=Str_FolderDiv (Str_StripDocNam (Document))+"ModStart"
//$err:=TestFile ($_t_StartPath)
//If (f>=0)  `if the folder exists

//This one won't work with Client unless Server drive is visible over network
//but the main purpose of it is for Silver users anyway
$_t_StructurePath:=StructureFilePath
//Folder separator:=DB_DirSymbol
For ($_l_PathIndex; Length:C16($_t_StructurePath); 1; -1)
	If ($_t_StructurePath[[$_l_PathIndex]]=Folder separator:K24:12)
		$_l_StructureName:=Substring:C12($_t_StructurePath; $_l_PathIndex+1; Length:C16($_t_StructurePath))
		$_t_StructurePath:=Substring:C12($_t_StructurePath; 1; $_l_PathIndex)
		$_l_PathIndex:=1
	End if 
End for 
If ($_l_StructureName="")
	$_l_StructureName:=$_t_StructurePath
	$_t_StructurePath:=""
End if 

$_t_StartPath:=Str_FolderDiv($_t_StructurePath)+"ModStart"
vDoc:=DB_OpenDocument(Str_FolderDiv($_t_StartPath)+"ModStart.TXT")
If (OK=0)
	Close_DocUMENT(vDoc)
	Gen_Confirm("When starting a new data file, it is best to automate the setup process."+Char:C90(13)+"Please show me the file 'ModStart.TXT' to allow this to proceed.  "+"The file should be found within the "+Term_Platform("Folder")+" named 'ModStart'.")
	If (OK=1)
		vDoc:=DB_OpenDocument("")
	End if 
End if 
If (OK=1)
	Array_LCx(0)
	vRec:=Char:C90(13)
	RECEIVE PACKET:C104(vDoc; vT; vRec)
	While (Length:C16(vT)>3)
		IDLE:C311  // 7/04/03 pb
		INSERT IN ARRAY:C227(GEN_at_Identity; 1; 1)
		INSERT IN ARRAY:C227(GEN_at_Name; 1; 1)
		GEN_at_Identity{1}:=First_Tab(vT)
		GEN_at_Name{1}:=vT
		RECEIVE PACKET:C104(vDoc; vT; vRec)
	End while 
	Close_DocUMENT(vDoc)
	
	If (Size of array:C274(GEN_at_Identity)>0)
		<>SYS_bo_CurrentWindowModal:=True:C214
		SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; >)
		Open_Any_Window(302; 450)
		DIALOG:C40([COMPANIES:2]; "dAsk StartImp")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If (OK=1)
			
			$_l_SizeofArray:=Size of array:C274(<>DB_at_TableNames)
			ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; $_l_SizeofArray)
			For ($_l_Index; 1; $_l_SizeofArray)
				MOD_al_ModuleAccessStatus{$_l_Index}:=1
			End for 
			If (Gen_Option)
				Open_Any_Window(297; 418)
				DIALOG:C40([COMPANIES:2]; "dStartup ImpOpt")
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
			Else 
				OK:=1
			End if 
			
			If (OK=1)
				
				If ((Records in table:C83([ORDERS:24])>0) | (Records in table:C83([PURCHASE_ORDERS:57])>0) | (Records in table:C83([INVOICES:39])>0) | (Records in table:C83([PURCHASE_INVOICES:37])>0) | (Records in table:C83([TRANSACTIONS:29])>0))
					Gen_Confirm("Transactions have been created in this Data File."+Char:C90(13)+Char:C90(13)+"Are you sure that you want to overwrite current setups "+"with those contained in the Business Template?"; "Yes"; "No")
				End if 
				
				If (OK=1)
					
					If (DB_t_CurrentFormUsage="Again")
						Gen_Confirm3("Do you want to delete all data in the files to be set up, and start again?"+"This is the recommended approach."+Char:C90(13)+Char:C90(13)+"If not, do you want to overwrite any duplicates, or to ignore them?"; "Start again"; "Ignore"; "Overwrite")
						If (OK=1) | (xNext=1)
							If (xNext=1)
								DB_t_CurrentFormUsage2:="Overwrite"
							Else 
								DB_t_CurrentFormUsage2:="Delete"
							End if 
						Else 
							DB_t_CurrentFormUsage2:="Ignore"
						End if 
					Else 
						DB_t_CurrentFormUsage2:="New"
					End if 
					
					GEN_at_Identity:=GEN_at_Name
					$_t_DocumentName:=GEN_at_Identity{GEN_at_Identity}
					Array_LCx(0)
					$_l_CharacterPosition:=0
					<>SYS_l_CancelProcess:=0
					
					vDoc:=DB_OpenDocument(Str_FolderDiv($_t_StartPath)+$_t_DocumentName)
					If (OK=0)
						Close_DocUMENT(vDoc)
						Gen_Confirm("Please show me the file '"+$_t_DocumentName+"', "+"which should be found within the "+Term_Platform("Folder")+" named 'ModStart'.")
						If (OK=1)
							vDoc:=DB_OpenDocument("")
						End if 
					End if 
					If (OK=1)
						<>SYS_bo_CurrentWindowModal:=True:C214
						RECEIVE PACKET:C104(vDoc; vT; 6)
						If (vT="Field:")
							RECEIVE PACKET:C104(vDoc; vT; 3)
							vFld:=Char:C90(Num:C11(vT))
							vFld:=Substring:C12(vFld; 1; 1)
							RECEIVE PACKET:C104(vDoc; vT; 8)
							RECEIVE PACKET:C104(vDoc; vT; 3)
							vRec:=Char:C90(Num:C11(vT))
							vFld:=Substring:C12(vFld; 1; 1)
							RECEIVE PACKET:C104(vDoc; vT; 1)
							RECEIVE PACKET:C104(vDoc; vT; 3)
							If (Num:C11(vT)>0)
								vRec:=vRec+Substring:C12(Char:C90(Num:C11(vT)); 1; 1)
							End if 
							RECEIVE PACKET:C104(vDoc; vT; 1)
							
							vText:=""
							vTitle2:="Start"
							$_t_ListName:=Remote_Packet(vRec)
							$_l_CharacterPosition:=Position:C15("{}"; $_t_ListName)
							//ARRAY LONGINT(aApptO;0)  //array to store the used files
							
							Startup_Import2(1)
						Else 
							Gen_Alert("That is not a valid Startup Import file"; "Cancel")
						End if 
						Close_DocUMENT(vDoc)
					Else 
						Gen_Alert("The File "+$_t_DocumentName+" was not found, so no setups have taken place")
					End if 
					
					If (($_l_CharacterPosition>0) & (<>SYS_l_CancelProcess=0))
						$_t_DocumentName:=Substring:C12($_t_ListName; $_l_CharacterPosition+2; 32000)
						If ($_t_DocumentName#"")
							vDoc:=DB_OpenDocument(Str_FolderDiv($_t_StartPath)+$_t_DocumentName)
							If (OK=0)
								Close_DocUMENT(vDoc)
								Gen_Confirm("Please show me the file '"+$_t_DocumentName+"', "+"which should be found within the "+Term_Platform("Folder")+" named 'ModStart'.")
								If (OK=1)
									vDoc:=DB_OpenDocument("")
								End if 
							End if 
							If (OK=1)
								RECEIVE PACKET:C104(vDoc; vT; 6)
								If (vT="Field:")
									RECEIVE PACKET:C104(vDoc; vT; 3)
									vFld:=Char:C90(Num:C11(vT))
									vFld:=Substring:C12(vFld; 1; 1)
									RECEIVE PACKET:C104(vDoc; vT; 8)
									RECEIVE PACKET:C104(vDoc; vT; 3)
									vRec:=Char:C90(Num:C11(vT))
									vRec:=Substring:C12(vRec; 1; 1)
									RECEIVE PACKET:C104(vDoc; vT; 1)
									RECEIVE PACKET:C104(vDoc; vT; 3)
									If (Num:C11(vT)>0)
										vRec:=vRec+Substring:C12(Char:C90(Num:C11(vT)); 1; 1)
									End if 
									RECEIVE PACKET:C104(vDoc; vT; 1)
									
									vText:=""
									vTitle2:="Start"
									$_t_ListName:=Remote_Packet(vRec)
									Startup_Import2(2)
								Else 
									Gen_Alert("That is not a valid Startup Import file"; "Cancel")
								End if 
								Close_DocUMENT(vDoc)
							Else 
								Gen_Alert("The File "+$_t_DocumentName+" was not found, so no setups have taken place")
							End if 
						End if 
					End if 
					
				End if 
			End if 
			<>SYS_bo_CurrentWindowModal:=False:C215
		End if 
	End if 
End if 
ON ERR CALL:C155("")
ERR_MethodTrackerReturn("Startup Import"; $_t_oldMethodName)
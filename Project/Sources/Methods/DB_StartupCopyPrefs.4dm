//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_StartupCopyPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 10:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DocumentNames; 0)
	C_BOOLEAN:C305($_bo_LastStructureFound; $_bo_NewVersion; $_bo_Retry)
	C_LONGINT:C283($_l_FolderOrDocumentType; $_l_Index; $_l_offset)
	C_TEXT:C284($_t_4DaPath; $_t_CopyPath; $_t_DataBaseName; $_t_Databasepath; $_t_DirectoryName; $_t_LastStructureName; $_t_lastStructurePath; $_t_oldMethodName; $_t_PackageDirectory; $_t_ParentPath; $_t_PreferencesPath)
	C_TEXT:C284($_t_SelectedFolder; $_t_StructureDirectory; $_t_StructurePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_StartupCopyPrefs")

If (Is compiled mode:C492) | (True:C214)
	//TRACE
	If ((Application type:C494=4D Local mode:K5:1) | (Application type:C494=4D Volume desktop:K5:2) | (Application type:C494=4D Server:K5:6))
		//LIST USER FORMS
		$_bo_NewVersion:=False:C215
		$_t_Databasepath:=Get 4D folder:C485(Database folder:K5:14)
		
		$_t_PreferencesPath:=$_t_Databasepath+"Preferences"
		//This is not a new data file
		$_t_DataBaseName:=Structure file:C489
		$_t_DataBaseName:=FileNamefromPath($_t_DataBaseName)
		$_t_DataBaseName:=Replace string:C233($_t_DataBaseName; ".4DB"; "")
		$_t_DataBaseName:=Replace string:C233($_t_DataBaseName; ".4DC"; "")
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=-9)
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=-9
			$_t_StructurePath:=Structure file:C489
			VARIABLE TO BLOB:C532($_t_DataBaseName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532($_t_StructurePath; [PREFERENCES:116]DataBlob:2; *)
			$_bo_NewVersion:=True:C214
			SAVE RECORD:C53([PREFERENCES:116])
		Else 
			$_l_offset:=0
			$_t_StructurePath:=Structure file:C489
			$_t_lastStructurePath:=""
			$_t_LastStructureName:=""
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_LastStructureName; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_lastStructurePath; $_l_offset)
				End if 
			End if 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532($_t_DataBaseName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532($_t_StructurePath; [PREFERENCES:116]DataBlob:2; *)
			AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
			
			SAVE RECORD:C53([PREFERENCES:116])
			
			If ($_t_lastStructurePath#$_t_StructurePath)
				$_bo_NewVersion:=True:C214
			End if 
		End if 
		$_t_Databasepath:=$_t_Databasepath+$_t_DataBaseName+".4DA"
		
		If ($_bo_NewVersion)
			
			//Gen_Confirm ("You are updating your version of daybook."+Char(13)+" Do you wish to copy preferences from your previous version?";"Yes";"No")
			If (OK=1)
				
				If ($_t_lastStructurePath#"")
					$_bo_LastStructureFound:=False:C215
					If (Test path name:C476($_t_lastStructurePath)=Is a document:K24:1)
						$_bo_LastStructureFound:=True:C214
					End if 
					
					//$LastStructurePackage:=PathFromPathName ($_t_lastStructurePath)
					
				Else 
					$_bo_LastStructureFound:=False:C215
				End if 
				If ($_bo_LastStructureFound)  //we have found the path to the .4dBase
					//user to select previous build...
					$_t_PackageDirectory:=PathFromPathName($_t_lastStructurePath)
					$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DC"; "")
					$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DB"; "")
					$_t_4DaPath:=$_t_PackageDirectory+$_t_LastStructureName+".4DA"
					$_t_CopyPath:=$_t_PackageDirectory+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml"
					If (Test path name:C476($_t_4DaPath)=Is a document:K24:1)
						$_t_StructureDirectory:=PathFromPathName($_t_StructurePath)
						If (Not:C34(Test path name:C476($_t_StructureDirectory+$_t_DataBaseName+".4DA")=Is a document:K24:1))
							COPY DOCUMENT:C541($_t_4DaPath; $_t_StructureDirectory+$_t_DataBaseName+".4DA")
						End if 
					End if 
					If (Test path name:C476($_t_CopyPath)=Is a document:K24:1)
						$_t_StructureDirectory:=PathFromPathName($_t_StructurePath)
						If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml")=Is a document:K24:1))
							If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences")=Is a folder:K24:2))
								
								CREATE FOLDER:C475($_t_StructureDirectory+"Preferences")
							End if 
							If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup")=Is a folder:K24:2))
								CREATE FOLDER:C475($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup")
							End if 
							COPY DOCUMENT:C541($_t_CopyPath; $_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml")
						End if 
					End if 
				Else 
					Gen_Confirm("You are updating your version of Daybook."+Char:C90(13)+" Do you wish to copy backup preferences from your previous version?"; "Yes"; "No")
					If (OK=1)
						$_t_ParentPath:=PathFromPathName(Get 4D folder:C485(Database folder:K5:14))
						$_t_SelectedFolder:=Select folder:C670("Select the previous version of Daybook you were running"; $_t_ParentPath; 2)
						If ($_t_SelectedFolder#"")
							$_t_CopyPath:=""
							$_bo_Retry:=False:C215
							Repeat 
								$_l_FolderOrDocumentType:=Test path name:C476($_t_SelectedFolder)
								//Here the user may have selected the .4Dbase or the preferences folder or the backupfolder
								If ($_l_FolderOrDocumentType=Is a folder:K24:2)
									$_t_DirectoryName:=DirectoryFromPathName($_t_SelectedFolder)
									Case of 
										: ($_t_DirectoryName="Backup")
											$_t_CopyPath:=$_t_SelectedFolder+"Backup.xml"
										: ($_t_DirectoryName="Preferences")
											$_t_CopyPath:=$_t_SelectedFolder+"Backup"+Folder separator:K24:12+"Backup.xml"
										: ($_t_DirectoryName="@.4Dbase")
											$_t_CopyPath:=$_t_SelectedFolder+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml"
										Else 
											$_t_CopyPath:=""
											$_bo_Retry:=False:C215
											Gen_Confirm("You have not selected a valid path, it should be the 4DBASE folder. Tey again?"; "Yes"; "No")
											If (OK=1)
												$_bo_Retry:=True:C214
											End if 
									End case 
								Else 
									
								End if 
							Until ($_t_CopyPath#"") | ($_bo_Retry=False:C215)
							If ($_t_CopyPath#"")
								$_t_PackageDirectory:=PathFromPathName($_t_CopyPath)
								
								$_t_PackageDirectory:=Replace string:C233($_t_PackageDirectory; "Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12; "")
								
								If ($_t_LastStructureName#"")
									$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DC"; "")
									$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DB"; "")
									$_t_4DaPath:=$_t_PackageDirectory+$_t_LastStructureName+".4DA"
								Else 
									DOCUMENT LIST:C474($_t_PackageDirectory; $_at_DocumentNames)
									For ($_l_Index; 1; Size of array:C274($_at_DocumentNames))
										If (Position:C15(".4DC"; $_at_DocumentNames{$_l_Index})>0)
											$_t_LastStructureName:=$_at_DocumentNames{$_l_Index}
											$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DC"; "")
											$_t_LastStructureName:=Replace string:C233($_t_LastStructureName; ".4DB"; "")
											$_l_Index:=Size of array:C274($_at_DocumentNames)
										End if 
									End for 
									
									If ($_t_LastStructureName#"")
										$_t_4DaPath:=$_t_PackageDirectory+$_t_LastStructureName+".4DA"
									Else 
										$_t_4DaPath:=$_t_PackageDirectory+"CD74.4DA"  //Just to prevent an error really
									End if 
								End if 
								If (Test path name:C476($_t_4DaPath)=Is a document:K24:1)
									$_t_StructureDirectory:=PathFromPathName($_t_StructurePath)
									If (Not:C34(Test path name:C476($_t_StructureDirectory+$_t_DataBaseName+".4DA")=Is a document:K24:1))
										COPY DOCUMENT:C541($_t_4DaPath; $_t_StructureDirectory+$_t_DataBaseName+".4DA")
									End if 
								End if 
								If (Test path name:C476($_t_CopyPath)=Is a document:K24:1)
									$_t_StructureDirectory:=PathFromPathName($_t_StructurePath)
									If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml")=Is a document:K24:1))
										If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences")=Is a folder:K24:2))
											
											CREATE FOLDER:C475($_t_StructureDirectory+"Preferences")
										End if 
										If (Not:C34(Test path name:C476($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup")=Is a folder:K24:2))
											CREATE FOLDER:C475($_t_StructureDirectory+"Preferences"+Folder separator:K24:12+"Backup")
										End if 
										COPY DOCUMENT:C541($_t_StructureDirectory; $_t_StructurePath+"Preferences"+Folder separator:K24:12+"Backup"+Folder separator:K24:12+"Backup.xml")
									End if 
								End if 
								
								
							End if 
							
						End if 
					End if 
					OK:=1
					
				End if 
			End if 
		End if 
	End if   //$_t_Databasepath:=$_t_Databasepath+$ReportName+".txt"
End if 
ERR_MethodTrackerReturn("DB_StartupCopyPrefs"; $_t_oldMethodName)
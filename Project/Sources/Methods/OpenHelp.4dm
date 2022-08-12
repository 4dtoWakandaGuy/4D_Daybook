//%attributes = {}
If (False:C215)
	//Project Method Name:      OpenHelp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 14:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Document)
	C_BOOLEAN:C305(<>HLP_bo_Inited; $_bo_OpenRecover)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_AltPath; $_t_ContextTable; Folder separator:K24:12; $_t_DocumentName; $_T_EditHelpReference; $_t_ForClientPathMac; $_t_ForClientPathPC; $_t_FullName; $_t_LocalCachePath; $_t_LookupFile; $_t_oldMethodName)
	C_TEXT:C284($_t_PluginPath; $_t_RescueFolder; $_t_StructureFolder; $_t_StructurePath; $_t_StructurePath2; $_t_StructurePathR; $2; HLP_T_EditHelpReference; vFormDocRreference)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OpenHelp")
$_t_FullName:=""
//If (False)
//TRACE
If (False:C215)
	If (Count parameters:C259>=2)
		If ($1>0) & ($2#"")
			If (Is table number valid:C999($1))
				$_T_EditHelpReference:=HLP_T_EditHelpReference
				$_t_ContextTable:=Table name:C256($1)+"_"+$2
				HLP_T_EditHelpReference:=$_t_ContextTable
				//ALERT(HLP_T_EditHelpReference)
				vFormDocRreference:="TOC"
				If (HLP_T_EditHelpReference#$_T_EditHelpReference)
					//Despite 4Ds documentation saying that the help file can be in the plug ins folder this does not appear to be true!
					//on SIngle user the help file needs to be in the same place as the structure(need to test with engined version
					
					Case of 
							
							
						: (Application type:C494<4)  // single user
							//Is a document =(Test path name($_t_FullName))
							$_t_StructurePath:=StructureFilePath
							$_t_StructurePath2:=Structure file:C489
							$_t_DocumentName:=FileNamefromPath($_t_StructurePath)
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DB"; "")
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DC"; "")
							
							//Folder separator:=DB_DirSymbol 
							$_t_StructurePath:=PathFromPathName($_t_StructurePath)
							
							//***************************** Changed 07/04/08 & v631b120p  -kmw v631b120h_7 *****************************
							//We were getting errors in volume licence single user.
							//This occurred when using the system used $_t_StructurePathR to copy the...
							//...help file into the folder "...Contents:Database:Plugins" which...
							//...does not exist in single user volume licence.
							
							//Tests have confirmed that neither kind of single user...
							//... ( Volume Licnece Single User OR 4th Dimension)...
							//...even looks in such a folder when displaying help (even...
							//...if there is none found in Mac4DX).
							
							//I'm not sure if it says differently elsewhere but I couldn't find any...
							//...reference to single user looking for help files in "plugins" folder...
							//...but i did find speciifc reference to it looking in mac4dx or win4d folders.
							
							//I have therefore changed this functionality as follows...
							
							//$_t_StructurePathR:=$_t_StructurePath+"Plugins"+Folder separator+$_t_DocumentName+".htm"
							If (Is macOS:C1572)
								$_t_StructurePathR:=$_t_StructurePath+"Mac4DX"+Folder separator:K24:12+$_t_DocumentName+".htm"
							Else 
								$_t_StructurePathR:=$_t_StructurePath+"Win4DX"+Folder separator:K24:12+$_t_DocumentName+".htm"
							End if 
							//***************************************************************************************************
							
							If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))  // | (True)
								
								//The document does not exist next to the application
								//Ok so look for file name 'DaybookHelp.htm"
								If (Application type:C494=4D Volume desktop:K5:2)
									
									$_t_StructurePath2:=StructureFilePath("PLUGINS")
									
									$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
								Else 
									$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
								End if 
								$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								
								
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
									$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
									While (Semaphore:C143("$WritingDocument"))
										DelayTicks(2)
									End while 
									If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
										
										//********** v631b120h_7 06/04/09 & v631b120p  -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
										
										//COPY DOCUMENT($_t_AltPath;$_t_FullName)
										//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)  `create the structure named file
										
										PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
										PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
										//**********************************************************************************************************************************
										
									Else   //The help file is missing
										$_t_StructurePathR:=""
									End if 
									CLEAR SEMAPHORE:C144("$WritingDocument")
									
								Else 
									While (Semaphore:C143("$WritingDocument"))
										DelayTicks
									End while 
									
									If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))  // structure named file does not exist
										If ($_t_FullName="")
											If (Application type:C494=4D Volume desktop:K5:2)
												
												$_t_StructurePath2:=StructureFilePath("PLUGINS")
												
												$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
											Else 
												$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
											End if 
											$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
											$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
											
											vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
											
											
											If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
												$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
												While (Semaphore:C143("$WritingDocument"))
													DelayTicks(2)
												End while 
												If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
													//********** v631b120h_7 06/04/09 & v631b120p  -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
													
													//COPY DOCUMENT($_t_AltPath;$_t_FullName)
													//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)  `create the structure named file
													
													PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
													PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
													//**********************************************************************************************************************************
													
													
												Else   //The help file is missing
													$_t_StructurePathR:=""
												End if 
												CLEAR SEMAPHORE:C144("$WritingDocument")
											End if 
										End if 
										//********** v631b120h_7 06/04/09 & v631b120p  -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
										//COPY DOCUMENT($_t_FullName;$_t_StructurePathR)
										PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_StructurePathR)
										//**********************************************************************************************************************************
										
									End if 
									CLEAR SEMAPHORE:C144("$WritingDocument")
									If (Application type:C494=4D Volume desktop:K5:2)
										
										$_t_StructurePath2:=StructureFilePath("PLUGINS")
										
										$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
									Else 
										$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
									End if 
									
									$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
									vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								End if 
							Else 
								While (Semaphore:C143("$WritingDocument"))
									DelayTicks(2)
								End while 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))  // structure named file does not exist
									If ($_t_FullName="")
										If (Application type:C494=4D Volume desktop:K5:2)
											
											$_t_StructurePath2:=StructureFilePath("PLUGINS")
											
											$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
										Else 
											$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
										End if 
										$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
										$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
										
										vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
										
										
										If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
											$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
											While (Semaphore:C143("$WritingDocument"))
												DelayTicks(2)
											End while 
											If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
												//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
												
												//COPY DOCUMENT($_t_AltPath;$_t_FullName)
												//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)  `create the structure named file
												
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
												//**********************************************************************************************************************************
												
												
											Else   //The help file is missing
												$_t_StructurePathR:=""
											End if 
											CLEAR SEMAPHORE:C144("$WritingDocument")
										End if 
									End if 
									
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of document copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_StructurePathR)
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_StructurePathR)
									//**********************************************************************************************************************************
									
								End if 
								CLEAR SEMAPHORE:C144("$WritingDocument")
								
								If (Application type:C494=4D Volume desktop:K5:2)
									
									$_t_StructurePath2:=StructureFilePath("PLUGINS")
									
									$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
								Else 
									$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
								End if 
								
								$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								If (Not:C34(<>HLP_bo_Inited))
									<>HLP_bo_Inited:=True:C214
									//This is the first time this help file is loaded in this session OR the help is updated
									HLP_MergeContextReference($_t_LookupFile)
									
								End if 
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
							End if 
							$_t_ForClientPathMac:=$_t_StructurePath+"Mac4DX"
							$_t_ForClientPathPC:=$_t_StructurePath+"Win4DX"
							
							If (Is a folder:K24:2=Test path name:C476($_t_ForClientPathMac))
								While (Semaphore:C143("$WritingDocument"))
									DelayTicks(2)
								End while 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_ForClientPathMac))))
									If ($_t_FullName="")
										If (Application type:C494=4D Volume desktop:K5:2)
											
											$_t_StructurePath2:=StructureFilePath("PLUGINS")
											
											$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
										Else 
											$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
										End if 
										$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
										$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
										
										vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
										
										
										If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
											$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
											While (Semaphore:C143("$WritingDocument"))
												DelayTicks(2)
											End while 
											If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
												//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
												
												//COPY DOCUMENT($_t_AltPath;$_t_FullName)
												//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)  `create the structure named file
												
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
												//**********************************************************************************************************************************
												
												
											Else   //The help file is missing
												$_t_StructurePathR:=""
											End if 
											CLEAR SEMAPHORE:C144("$WritingDocument")
										End if 
									End if 
									If ($_t_FullName="")
										If (Application type:C494=4D Volume desktop:K5:2)
											
											$_t_StructurePath2:=StructureFilePath("PLUGINS")
											
											$_t_PluginPath:=$_t_StructurePath2+"PlugIns"+Folder separator:K24:12
										Else 
											$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
										End if 
										$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
										$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
										
										vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
										
										
										If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
											$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
											While (Semaphore:C143("$WritingDocument"))
												DelayTicks(2)
											End while 
											If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
												//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
												
												//COPY DOCUMENT($_t_AltPath;$_t_FullName)
												//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)  `create the structure named file
												
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
												PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
												//**********************************************************************************************************************************
												
												
											Else   //The help file is missing
												$_t_StructurePathR:=""
											End if 
											CLEAR SEMAPHORE:C144("$WritingDocument")
										End if 
									End if 
									
									$_t_ForClientPathMac:=$_t_ForClientPathMac+Folder separator:K24:12+$_t_DocumentName+".htm"
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_ForClientPathMac)  `Copies the help file to mac 4dX
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_ForClientPathMac)
									//**********************************************************************************************************************************
									
								End if 
								CLEAR SEMAPHORE:C144("$writingDocument")
							Else 
								$_t_ForClientPathMac:=""
							End if 
							If (Is a folder:K24:2=Test path name:C476($_t_ForClientPathPC))
								While (Semaphore:C143("$WritingDocument"))
									DelayTicks(2)
								End while 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_ForClientPathPC))))
									$_t_ForClientPathPC:=$_t_ForClientPathPC+Folder separator:K24:12+$_t_DocumentName+".htm"
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_ForClientPathPC)  `Copies the help file to mac 4dX
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_ForClientPathPC)
									//**********************************************************************************************************************************
									
								End if 
								CLEAR SEMAPHORE:C144("$WritingDocument")
							Else 
								$_t_ForClientPathPC:=""
							End if 
						: (Application type:C494=4D Server:K5:6)  //-behave the same as single user
							//Is a document =(Test path name($_t_FullName))
							$_t_StructurePath:=Structure file:C489
							$_t_DocumentName:=FileNamefromPath($_t_StructurePath)
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DB"; "")
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DC"; "")
							
							$_t_StructurePath:=PathFromPathName($_t_StructurePath)
							//Folder separator:=DB_DirSymbol 
							$_t_StructurePath:=PathFromPathName($_t_StructurePath)
							$_t_StructurePathR:=$_t_StructurePath+"Plugins"+Folder separator:K24:12+$_t_DocumentName+".htm"
							
							
							If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))
								
								//The document does not exist next to the application
								//Ok so look for file name 'DaybookHelp.htm"
								
								$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
								$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist
									$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
									If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
										While (Semaphore:C143("$WritingDocument"))
											DelayTicks(2)
										End while 
										
										//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
										//COPY DOCUMENT($_t_AltPath;$_t_StructurePathR)
										//COPY DOCUMENT($_t_AltPath;$_t_FullName)  `create the structure named file
										PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_StructurePathR)
										PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
										//**********************************************************************************************************************************
										
										CLEAR SEMAPHORE:C144("$WritingDocument")
										
									Else   //The help file is missing
										$_t_FullName:=""
									End if 
								Else 
									If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))  // structure named file does not exist
										While (Semaphore:C143("$WritingDocument"))
											DelayTicks(2)
											
											IDLE:C311
										End while 
										
										//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
										//COPY DOCUMENT($_t_FullName;$_t_StructurePathR)
										PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_StructurePathR)
										//**********************************************************************************************************************************
										
										CLEAR SEMAPHORE:C144("$writingDocument")
										
									End if 
									$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
									$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
									vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								End if 
							Else 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))  // structure named file does not exist
									While (Semaphore:C143("$WritingDocument"))
										DelayTicks(2)
									End while 
									
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_StructurePathR)
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_StructurePathR)
									//**********************************************************************************************************************************
									
									CLEAR SEMAPHORE:C144("$writingDocument")
								End if 
								$_t_PluginPath:=$_t_StructurePath+"PlugIns"+Folder separator:K24:12
								$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
								
								
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
							End if 
							$_t_ForClientPathMac:=$_t_StructurePath+"Mac4DX"
							$_t_ForClientPathPC:=$_t_StructurePath+"Win4DX"
							If (Is a folder:K24:2=Test path name:C476($_t_ForClientPathMac))
								While (Semaphore:C143("$WritingDocument"))
									DelayTicks(2)
								End while 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_ForClientPathMac))))
									$_t_ForClientPathMac:=$_t_ForClientPathMac+Folder separator:K24:12+$_t_DocumentName+".htm"
									
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_ForClientPathMac)
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_ForClientPathMac)
									//**********************************************************************************************************************************
									
								End if 
								CLEAR SEMAPHORE:C144("$WritingDocument")
							Else 
								$_t_ForClientPathMac:=""
							End if 
							If (Is a folder:K24:2=Test path name:C476($_t_ForClientPathPC))
								While (Semaphore:C143("$WritingDocument"))
									DelayTicks(2)
								End while 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_ForClientPathPC))))
									$_t_ForClientPathPC:=$_t_ForClientPathPC+Folder separator:K24:12+$_t_DocumentName+".htm"
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_ForClientPathPC)
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_ForClientPathPC)
									//**********************************************************************************************************************************
									
								End if 
								CLEAR SEMAPHORE:C144("$WritingDocument")
							Else 
								$_t_ForClientPathPC:=""
							End if 
							
						Else 
							//client
							//```
							$_t_StructurePath:=Structure file:C489
							$_t_DocumentName:=$_t_StructurePath
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DB"; "")
							$_t_DocumentName:=Replace string:C233($_t_DocumentName; ".4DC"; "")
							
							//$_t_StructurePath:=PathFromPathName ($_t_StructurePath)
							$_t_StructurePathR:=Get 4D folder:C485(4D Client database folder:K5:13)  //path to the 4D folder for this database
							
							
							//Folder separator:=DB_DirSymbol 
							$_t_LocalCachePath:=Get 4D folder:C485(4D Client database folder:K5:13)
							$_t_PluginPath:=$_t_LocalCachePath+"PlugIns"+Folder separator:K24:12
							If (Is macOS:C1572)
								$_t_StructurePathR:=$_t_LocalCachePath+"Mac4DX"+Folder separator:K24:12+$_t_DocumentName+".htm"
							Else 
								$_t_StructurePathR:=$_t_LocalCachePath+"Win4DX"+Folder separator:K24:12+$_t_DocumentName+".htm"
							End if 
							$_t_FullName:=$_t_PluginPath+$_t_DocumentName+".htm"
							$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
							If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  // structure named file does not exist in the plugins folder
								
								
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								$_t_AltPath:=$_t_PluginPath+"daybookhelp"+".htm"  // look for the default document
								If (Is a document:K24:1=(Test path name:C476($_t_AltPath)))
									While (Semaphore:C143("$WritingDocument"))
										DelayTicks(2)
									End while 
									
									
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_AltPath;$_t_FullName)  `create the structure named file
									PDF995_DoDocument("COPY DOCUMENT"; $_t_AltPath; $_t_FullName)
									//**********************************************************************************************************************************
									
									
									CLEAR SEMAPHORE:C144("$WritingDocument")
									
								Else   //The help file is missing
									$_t_FullName:=""
								End if 
							Else 
								If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))
									$_t_FullName:=""
								End if 
								$_t_LookupFile:=$_t_PluginPath+"CONTEXTS"+".xml"
								vFormDocRreference:=HLP_GetContextReference($_t_LookupFile; $_t_ContextTable)
								
							End if 
							//now  make sure the proper help file is in the mac4DX or wind4DX
							If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_StructurePathR))))
								
								If ($_t_FullName#"")
									While (Semaphore:C143("$WritingDocument"))
										DelayTicks(2)
									End while 
									//********** v631b120h_7 & v631b120p  06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume **********
									//COPY DOCUMENT($_t_FullName;$_t_StructurePathR)
									PDF995_DoDocument("COPY DOCUMENT"; $_t_FullName; $_t_StructurePathR)
									//**********************************************************************************************************************************
									
									CLEAR SEMAPHORE:C144("$WritingDocument")
									
								Else 
									$_t_StructurePathR:=""
								End if 
							End if 
							
					End case 
					If ($1>0) & ($2#"")
						If ($_t_FullName#"") & ($_t_StructurePathR#"")  //Copy the base document  process the tag and update the real file
							While (Semaphore:C143("$WritingDocument"))
								DelayTicks(2)
							End while 
							
							If (Not:C34(Is a document:K24:1=(Test path name:C476($_t_FullName))))  //check if document exists v631b120h_7 06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume
								Gen_Alert("Developer Error. Document '"+$_t_FullName+"' does not exist (referred to by $_t_FullName). Attempt to open it cancelled.")
							Else 
								
								//Gen_Alert ("From OpenHelp ")  `26/1/2010
								
								$_ti_DocumentRef:=DB_OpenDocument($_t_FullName; "TEXT")
								
								//$DOC2:=Open Document("";"")
								//Close DocUMENT($DOC2)
								//$Creator:=Document creator(document)
								If (OK=1)
									CLOSE DOCUMENT:C267($_ti_DocumentRef)
									DOCUMENT TO BLOB:C525($_t_FullName; $_blb_Document)
									
									If (BLOB size:C605($_blb_Document)>0)
										PROCESS 4D TAGS:C816($_blb_Document; $_blb_Document)
										//if(OK=1)
										
										
										BLOB TO DOCUMENT:C526($_t_StructurePathR; $_blb_Document)
										
										If (Is macOS:C1572)
											//_O_SET DOCUMENT CREATOR($_t_StructurePathR;"    ")
											//_O_SET DOCUMENT TYPE($_t_StructurePathR;"    ")
											
										End if 
										
										
										If (Application type:C494<4)
											If (Is macOS:C1572)
												
												BLOB TO DOCUMENT:C526($_t_ForClientPathMac; $_blb_Document)
												
												//_O_SET DOCUMENT CREATOR($_t_ForClientPathMac;"    ")
												//_O_SET DOCUMENT TYPE($_t_ForClientPathMac;"    ")
												
												
											Else 
												BLOB TO DOCUMENT:C526($_t_ForClientPathPC; $_blb_Document)
											End if 
											
										End if 
										
										
										
									End if 
								End if 
							End if   //END IF check document exists. v631b120h_7 06/04/09 -KMW,  Trying to find cause of docunment copy problem in single user runtime volume
							CLEAR SEMAPHORE:C144("$WritingDocument")
						End if 
					End if 
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OpenHelp"; $_t_oldMethodName)


//Nigel Greenlee26/01/2010 11:38
//Nigel Greenlee26/01/2010 19:21
//Nigel Greenlee26/01/2010 21:30
//Nigel Greenlee20/11/2012 14:35 v7.0.0/1
ERR_MethodTrackerReturn("OpenHelp"; $_t_oldMethodName)

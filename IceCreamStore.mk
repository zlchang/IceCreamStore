##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=IceCreamStore
ConfigurationName      :=Debug
WorkspaceConfiguration :=Debug
WorkspacePath          :=/Users/zilongchang/Documents/Documents
ProjectPath            :=/Users/zilongchang/Documents/Documents/IceCreamStore
IntermediateDirectory  :=../build-$(WorkspaceConfiguration)/IceCreamStore
OutDir                 :=$(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=zilongchang
Date                   :=18/11/2026
CodeLitePath           :=/Users/zilongchang/.codelite
MakeDirCommand         :=mkdir -p
LinkerName             :=/usr/bin/g++
SharedObjectLinkerName :=/usr/bin/g++ -dynamiclib -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputDirectory        :=/Users/zilongchang/Documents/Documents/build-$(WorkspaceConfiguration)/bin
OutputFile             :=../build-$(WorkspaceConfiguration)/bin/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=$(IntermediateDirectory)/ObjectsList.txt
PCHCompileFlags        :=
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overridden using an environment variable
##
AR       := /usr/bin/ar rcu
CXX      := /usr/bin/g++
CC       := /usr/bin/gcc
CXXFLAGS :=  -O0 -gdwarf-2 -std=c++20 -Wall $(Preprocessors)
CFLAGS   :=  -O0 -gdwarf-2 -std=c++20 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := /usr/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
Objects0=$(IntermediateDirectory)/ice-cream-store-utils.cc$(ObjectSuffix) $(IntermediateDirectory)/ice-cream-store.cc$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: MakeIntermediateDirs $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) "$(IntermediateDirectory)"
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@$(MakeDirCommand) "$(IntermediateDirectory)"
	@$(MakeDirCommand) "$(OutputDirectory)"

$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "$(IntermediateDirectory)"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/ice-cream-store-utils.cc$(ObjectSuffix): ice-cream-store-utils.cc $(IntermediateDirectory)/ice-cream-store-utils.cc$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/zilongchang/Documents/Documents/IceCreamStore/ice-cream-store-utils.cc" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ice-cream-store-utils.cc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ice-cream-store-utils.cc$(DependSuffix): ice-cream-store-utils.cc
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ice-cream-store-utils.cc$(ObjectSuffix) -MF$(IntermediateDirectory)/ice-cream-store-utils.cc$(DependSuffix) -MM ice-cream-store-utils.cc

$(IntermediateDirectory)/ice-cream-store-utils.cc$(PreprocessSuffix): ice-cream-store-utils.cc
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ice-cream-store-utils.cc$(PreprocessSuffix) ice-cream-store-utils.cc

$(IntermediateDirectory)/ice-cream-store.cc$(ObjectSuffix): ice-cream-store.cc $(IntermediateDirectory)/ice-cream-store.cc$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/Users/zilongchang/Documents/Documents/IceCreamStore/ice-cream-store.cc" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ice-cream-store.cc$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ice-cream-store.cc$(DependSuffix): ice-cream-store.cc
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ice-cream-store.cc$(ObjectSuffix) -MF$(IntermediateDirectory)/ice-cream-store.cc$(DependSuffix) -MM ice-cream-store.cc

$(IntermediateDirectory)/ice-cream-store.cc$(PreprocessSuffix): ice-cream-store.cc
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ice-cream-store.cc$(PreprocessSuffix) ice-cream-store.cc


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r $(IntermediateDirectory)



#!/bin/sh

#  headerdoc-make.sh
#  MoofFoundation
#
#  Created by Tristan Leblanc on 19/03/16.
#  Copyright © 2016 MooseFactory. All rights reserved.

headerdoc2html -p -j ../MoofFoundation/MFTypes.h -o HeaderDocs

headerdoc2html -p -j ../MoofFoundation/Extras/NSArray+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSData+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSDate+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSDate+MFExtrasFormat.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSDictionary+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSFileManager+MFExtras.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Extras/NSString+MFExtras.h -o HeaderDocs


headerdoc2html -p -j ../MoofFoundation/Dates/MFDateRange.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Dates/MFDateUtils.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Dates/MFPeriod.h -o HeaderDocs

headerdoc2html -p -j ../MoofFoundation/Formatters/MFChronoTimeFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Formatters/MFMoneyFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Formatters/MFSingularPluralFormatter.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Formatters/MFLatLongFormatter.h -o HeaderDocs

headerdoc2html -p -j ../MoofFoundation/Maths/MFMathUtilities.h -o HeaderDocs
headerdoc2html -p -j ../MoofFoundation/Maths/MFFastTrigo.h -o HeaderDocs

headerdoc2html -p -j ../MoofFoundation/System/MFSystem.h -o HeaderDocs


./appledoc.sh

cp -R ~/help/MooseFactory\ Software/MoofFoundation ~/Library/Developer/Shared/Documentation/DocSets

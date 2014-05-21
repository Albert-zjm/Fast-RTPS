/*************************************************************************
 * Copyright (c) 2014 eProsima. All rights reserved.
 *
 * This copy of eProsima RTPS is licensed to you under the terms described in the
 * EPROSIMARTPS_LIBRARY_LICENSE file included in this distribution.
 *
 *************************************************************************/

/**
 * @file EndpointDiscoveryProtocol.h
 *
 *  Created on: May 16, 2014
 *      Author: Gonzalo Rodriguez Canosa
 *      email:  gonzalorodriguez@eprosima.com
 *              grcanosa@gmail.com  	
 */

#ifndef ENDPOINTDISCOVERYPROTOCOL_H_
#define ENDPOINTDISCOVERYPROTOCOL_H_

#include "eprosimartps/rtps_all.h"
#include "eprosimartps/common/attributes/TopicAttributes.h"
//#include "eprosimartps/common/attributes/ReliabilityAttributes.h"
//#include "eprosimartps/common/attributes/PublisherAttributes.h"
//#include "eprosimartps/common/attributes/SubscriberAttributes.h"
#include "eprosimartps/common/attributes/ParticipantAttributes.h"
//#include "eprosimartps/writer/RTPSWriter.h"
//#include "eprosimartps/reader/RTPSReader.h"
//#include "eprosimartps/discovery/ParticipantDiscoveryProtocol.h"

namespace eprosima {
namespace rtps {

class Endpoint;
class RTPSReader;
class RTPSWriter;
class Participant;
class ParticipantDiscoveryProtocol;
class DiscoveredParticipantData;


class EndpointDiscoveryProtocol  {
public:
	EndpointDiscoveryProtocol();
	virtual ~EndpointDiscoveryProtocol();


	virtual bool initEDP(DiscoveryAttributes& attributes)=0;

	virtual bool localWriterMatching(RTPSWriter* writer,bool first_time)=0;
	virtual bool localReaderMatching(RTPSReader* reader,bool first_time)=0;

	virtual void assignRemoteEndpoints(DiscoveredParticipantData* pdata)=0;

	Participant* mp_participant;
	ParticipantDiscoveryProtocol* mp_PDP;

};

} /* namespace rtps */
} /* namespace eprosima */

#endif /* ENDPOINTDISCOVERYPROTOCOL_H_ */
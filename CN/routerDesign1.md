---
id: computer-networks-router-design-and-algorithms-part-1
title: Router Design and Algorithms (Part 1)
course: computer-networks
lecture: router-design-and-algorithms-part-1
---

# Router Design and Algorithms (Part 1) [↩](../Contents/CN.md)

## What's Inside a Router?

### What are the basic components of a router?

The main job of a router is to implement the forwarding plane functions and the control plane functions.

**Forwarding (or switching) function:**

This is the router's action to transfer a packet from an input link interface to the appropriate output link interface. Forwarding takes place at very short timescales (typically a few nanoseconds), and is typically implemented in hardware.

The router's architecture is shown in the figure below. The main components of a router are the input/output ports, the switching fabric and the routing processor.

![](https://assets.omscs.io/notes/0104.png)

![](https://assets.omscs.io/notes/0105.png)

**Input ports:**

There are several functionalities that are performed by the input ports.

If we look at the figure from left to right, the first function is to physically terminate the incoming links to the router.
Second, the data link processing unit decapsulates the packets.
Finally, and most importantly, the input ports perform the lookup function. At this point, the input ports consult the forwarding table to ensure that each packet is forwarded to the appropriate output port through the switch fabric.

**Switching fabric:**

Simply put, the switching fabric moves the packets from input to output ports, and it makes the connections between the input and the output ports. There are three types of switching fabrics: memory, bus, and crossbar.

**Output ports:**

An important function of the output ports is to receive and queue the packets which come from the switching fabric and then send them over to the outgoing link.

![](https://assets.omscs.io/notes/0106.png)

**Router's control plane functions:**

By control plane functions we refer to implementing the routing protocols, maintaining the routing tables, computing the forwarding table. All these functions are implemented in software in the routing processor, or as we will see in the SDN chapter, these functions could be implemented by a remote controller.

![](https://assets.omscs.io/notes/0107.png)

## Router Architecture

In this topic, we will take a closer look at the router's architecture.

![](https://assets.omscs.io/notes/0108.png)

A router has input links and output links and its main task is to switch a packet from an input link to the appropriate output link based on the destination address. We note that in this figure, the input/output links are shown separately but often they are put together.

Now let's look at what happens when a packet arrives at an input link. First, let's take a look at the most time-sensitive tasks: lookup, switching, and scheduling.

**Lookup:** When a packet arrives at the input link, the router looks at the destination IP address and determines the output link by looking at the forwarding table (or Forwarding Information Base or FIB). The FIB provides a mapping between destination prefixes and output links.

To resolve any disambiguities, the routers use the longest prefix matching algorithms which we will see in a few topics. Also, some routers offer a more specific and complex type of lookup, called packet classification, where the lookup is based on destination or source IP addresses, port, and other criteria.

**Switching:** After lookup, the switching system takes over to transfer the packet from the input link to the output link. Modern fast routers use crossbar switches for this task. Though scheduling the switch (matching available inputs with outputs) is a difficult task because multiple inputs may want to send packets to the same output.

**Queuing:** After the packet has been switched to a specific output, it will need to be queue (if the link is congested). The queue maybe as simple as First-In-First-Out (FIFO) or it may be more complex (eg weighted fair queuing) to provide delay guarantees or fair bandwidth allocation.

Now, let's look at some less time-sensitive tasks that take place in the router.

**Header validation and checksum:** The router checks the packet's version number, it decrements the time-to-live (TTL) field, and also it recalculates the header checksum.

**Route processing:** The routers build their forwarding tables using routing protocols such as RIP, OSPF, and BGP. These protocols are implemented in the routing processors.

**Protocol Processing:** The routers, in order to implement their functions, need to implement the following protocols: a) The simple network management protocol (SNMP) that provides a set of counters for remote inspection, b) TCP and UDP for remote communication with the router, c) Internet control message protocol (ICMP), for sending error messages, eg when time to live time is exceeded.

## Different Types of Switching

Let's take a closer look into the switching fabric.

![](https://assets.omscs.io/notes/0109.png)

The switching fabric is the brains of the router, as it actually performs the main task to switch (or forward) the packets from an input port to an outport port.

Let's look at the ways that this can be accomplished:

![](https://assets.omscs.io/notes/0110.png)

**Switching via memory.** Input/Output ports operate as I/O devices in an operating system, and they are controlled by the routing processor. When an input port receives a packet, it sends an interrupt to the routing processor and the packet is copied to the processor's memory. Then the processor extracts the destination address and looks into the forward table to find the output port, and finally the packet is copied into that output's port buffer.

![](https://assets.omscs.io/notes/0111.png)

**Switching via bus:** In this case, the routing processor does not intervene as we saw the switching via memory. When an input port receives a new packet, it puts an internal header that designates the output port, and it sends the packet to the shared bus. Then all the output ports will receive the packet, but only the designated one will keep it. When the packet arrives at the designated output port, then the internal header is removed from the packet. Only one packet can cross the bus at a given time, and so the speed of the bus limits the speed of the router.

![](https://assets.omscs.io/notes/0112.png)

**Switching via interconnection network:** A crossbar switch is an interconnection network that connects N input ports to N output ports using 2N buses. Horizontal buses meet the vertical buses at crosspoints which are controlled by the switching fabric. For example, let's suppose that a packet arrives at port A that will need to be forwarded to output port Y, the switching fabric closes the crosspoint where the two buses intersect, so that port A can send the packets onto the bus and then the packet can only be picked up by output port Y. Crossbar network can carry multiple packets at the same time, as long as they are using different input and output ports. For example, packets can go from A-to-Y and B-to-X at the same time.

![](https://assets.omscs.io/notes/0113.png)

## Challenges that the router faces

The fundamental problems that a router faces revolve around:

**Bandwidth and Internet population scaling:** These scaling issues are caused by: a) An increasing number of devices that connect to the Internet, 2) Increasing volumes of network traffic due to new applications, and 3) New technologies such as optical links that can accommodate higher volumes of traffic.

**Services at high speeds:** New applications require services such as protection against delays in presence of congestion, and protection during attacks or failures. But offering these services at very high speeds is a challenge for routers.
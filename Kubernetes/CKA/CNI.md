# CNI

if docker used the same way of the system to create the bridge and uses vEth, why wouldn't it be a standard

that is when CNI Comes in:

the CNI or Container network interface is a set of standards that define how programs should be developed to solve networking challenges in a container runtime environment.

the programs of the CNI are called plugins, in this case the bridge command program is a plugin, CNI defines how plugins should be developed, and how container runtimes should invoke them
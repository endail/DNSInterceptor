from PythonDNS.InterceptResolver import InterceptResolver
from dnslib.server import DNSLogger, DNSServer
import argparse, time
from .helpers import loadConfig

p = argparse.ArgumentParser(prog="DNSInterceptor")

p.add_argument("config_file",
    type=str,
    metavar="configuration file",
    help="Path to DNSInterceptor configuration file")

args = p.parse_args()
config = loadConfig(args.config_file)

print("Starting DNSInterceptor on %s:%d, forwarding to %s:%d" % (
    config['local']['address'], config['local']['port'],
    config['upstream']['address'], config['upstream']['port']
))

resolver = InterceptResolver(
    config['upstream']['address'],
    config['upstream']['port'],
    config['filters']['cloakfile'],
    config['filters']['blacklistfile'],
    config['upstream']['timeout'])

print("<%d CloakRules Imported>" % len(resolver.cloakrules))
print("<%d BlacklistRules Imported>" % len(resolver.blacklistrules))

udp_server = DNSServer(
    resolver,
    port=config['local']['port'],
    address=config['local']['address'])

udp_server.start_thread()

while udp_server.isAlive():
    time.sleep(1)

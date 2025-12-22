# Azure Setup

## Create Storage Account

1. Go to Azure Portal → Storage accounts
2. Click "Create"
3. Basic settings:
   - Subscription: Your subscription
   - Resource group: Create new or use existing
   - Storage account name: Unique name (e.g., `hybridstoragelab`)
   - Region: Choose closest region
   - Performance: Standard
   - Redundancy: Locally-redundant storage (LRS)

## Networking

For lab purposes, keep default settings (public access enabled).

**Production note**: In enterprise environments, use private endpoints and VNet integration.

## Create Container

1. Go to your Storage Account → Containers
2. Click "Container"
3. Name: `hybrid-storage-lab`
4. Public access level: Private

## Get Credentials

### Option A: Access Key (Recommended for Lab)

1. Storage Account → Access keys
2. Copy:
   - Account name
   - Key1 (primary key)

### Option B: SAS Token (More Secure)

1. Storage Account → Shared access signature
2. Generate SAS for Blob service
3. Copy the SAS token

**Note**: SAS tokens provide least privilege access in production environments.

## Security Considerations

- Use SAS tokens over full access keys when possible
- Enable encryption at rest (default)
- Configure private endpoints for production
- Enable Azure Storage logging and monitoring
